package collect

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gconv"
	"platform/app/model"
	"platform/app/server"
	"platform/app/server/report"
	"platform/library/help"
	"platform/library/redis"
	"time"
)

type Pull struct {}

var Step interface{}

func init()  {}
type Sub struct {
	where g.Map
	task []*tasks
}

type bills struct {
	UserId int32 `json:"user_id"`
	Amount int32 `json:"amount"`
	Operate byte `json:"operate"`
	Role byte `json:"role"`
	Type byte `json:"type"`
}

type tasks struct {
	UserId int32 `json:"user_id"`
	// 发布任务
	TaskPublishCount int32 `json:"task_publish_count"`
	TaskPublishMoneySum int32 `json:"task_publish_money_sum"`
	TaskPublishAcceptCount int32 `json:"task_publish_accept_count"`
	TaskPublishSuccessAcceptCount int32 `json:"task_publish_success_accept_count"`
	TaskPublishEndCount int32 `json:"task_publish_end_count"`
	TaskPublishSuccessCount int32 `json:"task_publish_success_count"`
	TaskPublishChildrenCount int32 `json:"task_publish_children_count"`

	// 接单任务
	TaskPublishChildrenSuccessCount int32 `json:"task_publish_children_success_count"`
	TaskPublishChildrenWaitCount int32 `json:"task_publish_children_wait_count"`
	TaskPublishChildrenFailureCount int32 `json:"task_publish_children_failure_count"`
	TaskSubscribeCount int32 `json:"task_subscribe_count"`
	TaskSubscribeMoneySum int32 `json:"task_subscribe_money_sum"`
	TaskSubscribeStatusSuccessCount int32 `json:"task_subscribe_status_success_count"`
	TaskSubscribeStatusFailureCount int32 `json:"task_subscribe_status_failure_count"`
	TaskSubscribeStatusWaitCount int32 `json:"task_subscribe_status_wait_count"`
}


type datas struct {
	UserId int32 `json:"user_id"`
	// 存款
	UserDepositCount int32 `json:"user_deposit_count"`
	UserDepositMoneySum int32 `json:"user_deposit_money_sum"`
	UserDepositMoneyMax int32 `json:"user_deposit_money_max"`
	UserDepositManualMoneySum int32 `json:"user_deposit_manual_money_sum"`
	UserDepositManualMoneyCount int32 `json:"user_deposit_manual_money_count"`
	UserDepositManualMoneyMax int32 `json:"user_deposit_manual_money_max"`
	// 取款
	UserWithdrawCount int32 `json:"user_withdraw_count"`
	UserWithdrawMoneySum int32 `json:"user_withdraw_money_sum"`
	UserWithdrawMoneyMax int32 `json:"user_withdraw_money_max"`
	UserWithdrawManualMoneySum int32 `json:"user_withdraw_manual_money_sum"`
	UserWithdrawManualMoneyCount int32 `json:"user_withdraw_manual_money_count"`
	UserWithdrawManualMoneyMax int32 `json:"user_withdraw_manual_money_max"`
}

func (Pull) PullUser ()  {
	// 同步会信息 - report
	glog.Level(glog.LEVEL_INFO).Println("--- 本次会员同步时间: "+ time.Now().Format(help.TIME_FORMAT_OUT) + " -------")
	var tempBase  []*model.ReportBases
	userRedis, _ := user_get()
	ids := g.Slice{}
	where_user := g.Map{}
	where_user["last_login_time between ? and ?"] = g.Slice{help.TimeStrips(0,0,0), help.TimeStrips(0,0,1)}
	fields := "current_date as date, id as user_id, parent_id as user_parent_id, balance as user_balance, commission as user_commission, phone as user_phone, NOW() as created_at, NOW() as updated_at"
	if userRedis == nil {
		result, _ := server.ModelUser.Get(where_user, fields, "", "")
		_ = result.Structs(&tempBase)
		for _, v := range tempBase {
			ids = append(ids, v.UserId)
		}
		if len(ids) > 0 {
			// 初始化报表
			reportInit, _ := report.ModelReportBase.Create(tempBase)
			if reportInit == nil {
				glog.Level(glog.LEVEL_ERRO).Println("初始化报表数据失败..\n", tempBase)
			}
			tempIds, _ := json.Marshal(ids)
			_, _ = user_set(tempIds)
		}
	} else {
		_ = json.Unmarshal(gconv.Bytes(userRedis), &ids)
		where_user["id not"] = gconv.SliceInt(ids)
		userNew, _ := server.ModelUser.Get(where_user, fields, "", "")
		_ = userNew.Structs(&tempBase)
		// 创建新会员信息到 - 报表
		if userNew != nil {
			var newIds g.Slice
			for _, v := range tempBase {
				newIds 	= append(newIds, v.UserId) 	// 新会员
				ids 	= append(ids, v.UserId)		// 累计会员
			}
			reportCreate, _ := report.ModelReportBase.Create(tempBase)
			if reportCreate == nil {
				glog.Level(glog.LEVEL_ERRO).Println("创建报表数据失败..\n", tempBase)
			}
			// 重新加载所有会员id存入redis
			tempIds, _ := json.Marshal(ids)
			_, _ = user_set(tempIds)
		} else {
			if len(ids) > 0 {
				delete(where_user, "id not")
				where_user["id"] = ids
				field_user := "id as user_id, balance as user_balance, commission as user_commission, NOW() as updated_at"
				userOld, _ := server.ModelUser.Get(where_user, field_user, "", "")
				tempReport := userOld.List()
				columns := g.Array{
					"user_id",
					"user_balance",
					"user_commission",
					"updated_at",
				}
				// 更新redis会员信息到 - 报表
				sql := help.Sql(new(model.ReportBases).TableName(), columns, tempReport, "user_id", "")
				sql  = sql + fmt.Sprintf(" and `date` between '%v' and '%v' ", help.TimeStrips(0,0,0).Format(help.TIME_FORMAT_DAY_OUT), help.TimeStrips(0,0,1).Format(help.TIME_FORMAT_DAY_OUT))
				err := report.ModelReportBase.Querys(sql)
				if err != nil {
					glog.Level(glog.LEVEL_ERRO).Println("更新报表数据失败..\n", sql)
				} else {
					glog.Level(glog.LEVEL_INFO).Println("-- {"+gconv.String(len(ids))+"} - 用户数据报表更新成功..\n", sql)
				}
			}
		}
	}
	where_user = nil
}

func (Pull) PullBills (start_time string, ids g.Slice)  {

	glog.Level(glog.LEVEL_INFO).Println("--- 本次账单同步时间: "+ start_time + " -------")

	where_money := g.Map{}
	// 当日
	where_money["created_at between ? and ?"] = g.Slice{help.TimeStrips(0,0,0), help.TimeStrips(0,0,1)}
	// 本次查询时间
	 where_money["created_at > "] = start_time
	// 收集会员
	where_money["user_id"] = ids
	billResult, _ := server.ModelBill.Get(where_money, "user_id, type, role, operate, amount", "", "")
	var bill []bills
	if billResult == nil {
		glog.Level(glog.LEVEL_INFO).Println("-- 尚未发现账单信息..\n")
		return
	}
	_ = billResult.Structs(&bill)
	// 重组需要收集的字段，组成批量修改sql
	data := step_money(bill)
	columns := g.Array{
		"user_id",
		"user_deposit_count",
		"user_deposit_money_sum",
		"user_deposit_money_max",
		"user_deposit_manual_money_sum",
		"user_deposit_manual_money_count",
		"user_deposit_manual_money_max",
		"user_withdraw_count",
		"user_withdraw_money_sum",
		"user_withdraw_money_max",
		"user_withdraw_manual_money_sum",
		"user_withdraw_manual_money_count",
		"user_withdraw_manual_money_max",
	}
	sql := help.Sql(new(model.ReportBases).TableName(), columns, data, "user_id", "+")
	sql  = sql + fmt.Sprintf(" and `date` between '%v' and '%v' ", help.TimeStrips(0,0,0).Format(help.TIME_FORMAT_DAY_OUT), help.TimeStrips(0,0,1).Format(help.TIME_FORMAT_DAY_OUT))
	err := report.ModelReportBase.Querys(sql)
	if err != nil {
		glog.Level(glog.LEVEL_ERRO).Println("-- 同步账单流水失败..\n", sql)
	} else {
		glog.Level(glog.LEVEL_NOTI).Println("-- {"+gconv.String(len(ids))+"} -同步账单流水成功..\n", sql)
	}
	where_money = nil
}

func (Pull) PullTaskPublish (start_time string,  ids g.Slice)  {

	glog.Level(glog.LEVEL_INFO).Println("--- 本次发布任务同步时间: "+ start_time + " -------")

	where_task := g.Map{}
	// 当日
	where_task["updated_at between ? and ?"] = g.Slice{help.TimeStrips(0,0,0), help.TimeStrips(0,0,1)}
	// 本次查询时间
	where_task["updated_at > "] = start_time
	// 收集会员
	where_task["user_id"] = ids
	task := publish(where_task)
	if task == nil {
		glog.Level(glog.LEVEL_ERRO).Println("--- 尚未有需要同步的发布任务数据..\n")
		return
	}
	// 更新数据
	taskResult := gconv.Maps(task)
	columns := g.Array{
		"user_id",
		"task_publish_count",
		"task_publish_children_count",
		"task_publish_money_sum",
		"task_publish_accept_count",
		"task_publish_success_accept_count",

	}
	// 同步发布任务 - 报表
	sql := help.Sql(new(model.ReportBases).TableName(), columns, taskResult, "user_id", "+")
	sql  = sql + fmt.Sprintf(" and `date` between '%v' and '%v' ", help.TimeStrips(0,0,0).Format(help.TIME_FORMAT_DAY_OUT), help.TimeStrips(0,0,1).Format(help.TIME_FORMAT_DAY_OUT))
	err := report.ModelReportBase.Querys(sql)
	if err != nil {
		glog.Level(glog.LEVEL_ERRO).Println("-- 发布任务同步报表数据失败..\n", sql)
	} else {
		glog.Level(glog.LEVEL_INFO).Println("-- {"+gconv.String(len(ids))+"} - 发布任务同步数据报表更新成功..\n", sql)
	}

}

func (Pull) PullTaskSubscribe (start_time string,  ids g.Slice)  {

	glog.Level(glog.LEVEL_INFO).Println("--- 本次接单任务同步时间: "+ start_time + " -------")
	where_task := g.Map{}
	// 当日
	where_task["updated_at between ? and ?"] = g.Slice{help.TimeStrips(0,0,0), help.TimeStrips(0,0,1)}
	// 本次查询时间
	where_task["updated_at > "] = start_time
	// 收集会员
	where_task["user_id"] = ids
	task := subscribe(where_task)
	if task == nil {
		glog.Level(glog.LEVEL_ERRO).Println("--- 尚未有需要同步的接单任务数据..\n")
		return
	}
	// 更新数据
	taskResult := gconv.Maps(task)
	columns := g.Array{
		"user_id",
		"task_publish_end_count",
		"task_publish_success_count",
		"task_publish_children_success_count",
		"task_publish_children_wait_count",
		"task_publish_children_failure_count",
		"task_subscribe_count",
		"task_subscribe_money_sum",
		"task_subscribe_status_success_count",
		"task_subscribe_status_failure_count",
		"task_subscribe_status_wait_count",
	}
	// 同步接单任务 - 报表
	sql := help.Sql(new(model.ReportBases).TableName(), columns, taskResult, "user_id", "+")
	sql  = sql + fmt.Sprintf(" and `date` between '%v' and '%v' ", help.TimeStrips(0,0,0).Format(help.TIME_FORMAT_DAY_OUT), help.TimeStrips(0,0,1).Format(help.TIME_FORMAT_DAY_OUT))
	err := report.ModelReportBase.Querys(sql)
	if err != nil {
		glog.Level(glog.LEVEL_ERRO).Println("-- 接单任务同步报表数据失败..\n", sql)
	} else {
		glog.Level(glog.LEVEL_INFO).Println("-- {"+gconv.String(len(ids))+"} - 接单任务同步数据报表更新成功..\n", sql)
	}
}


func publish(where_task g.Map) []tasks {

	var task []tasks
	fields_step_1 := `
user_id, 
COUNT(id) 			as task_publish_count, 
SUM(count) 			as task_publish_children_count, 
SUM(amount * count) as task_publish_money_sum, 
SUM(accept) 		as task_publish_accept_count,
SUM(success) 		as task_publish_success_accept_count
`

	taskResult, _ := server.ModelTaskPublish.Get(where_task, fields_step_1, "user_id", "")
	if taskResult == nil {
		return task
	}
	_ = taskResult.Structs(&task)
	fileld_step_2 := "user_id, COUNT(id) as task_publish_end_count"
	where_task["status between ? and ?"] = g.Slice{server.PUBLISH_STATUS_REFUSE, server.PUBLISH_STATUS_DELETE}
	taskResultStatus, _ := server.ModelTaskPublish.Get(where_task, fileld_step_2, "user_id", "")
	type statuss struct {
		UserId int32 `json:"user_id"`
		TaskPublishEndCount int32 `json:"task_publish_end_count"`
	}
	if taskResultStatus != nil {
		var tempStatus []statuss
		_ = taskResultStatus.Structs(&tempStatus)
		for k, v := range task {
			for _, val := range tempStatus {
				if v.UserId == val.UserId {
					task[k].TaskPublishEndCount = val.TaskPublishEndCount
					task[k].TaskPublishSuccessCount = task[k].TaskPublishCount - val.TaskPublishEndCount
				}
			}
		}
	}
	delete(where_task, "status between ? and ?")
	return task

}

func subscribe(where_task g.Map)  interface{} {
	var sub Sub
	sub.where = where_task
	task := sub.get_sub_step_aggregation()
	if task == nil {
		return nil
	}
	sub.get_sub_step_failure()
	sub.get_sub_step_success()
	sub.get_sub_self_step_success()
	sub.get_sub_self_step_failure()
	return sub.task
}

func (s *Sub) get_sub_step_aggregation() interface{} {

	fields_step := `
user_id,
COUNT(id) as 	task_subscribe_count,
SUM(amount) as 	task_subscribe_money_sum
`
	subscribeResult, err := server.ModelTaskSubscribe.Get(s.where, fields_step, "user_id", "")
	if err != nil || subscribeResult == nil {
		return nil
	}
	_ = subscribeResult.Structs(&s.task)
	return  s.task
}
func (s *Sub) get_sub_step_failure() interface{} {

	// 接单失败
	s.where["status between ? and ?"] = g.Slice{server.SUBSCRIBE_STATUS_REWAIT_FAILURE, server.SUBSCRIBE_STATUS_FAILURE}
	fields_step := "user_id, COUNT(id) as 	task_subscribe_status_failure_count"
	subscribeFaildResult, err := server.ModelTaskSubscribe.Get(s.where, fields_step, "user_id", "")
	if err == nil {
		type tempSubsFailds struct {
			UserId int32 `json:"user_id"`
			TaskSubscribeStatusFailureCount int32 `json:"task_subscribe_status_failure_count"`
		}
		var tempSubFaild []tempSubsFailds
		_ = subscribeFaildResult.Structs(&tempSubFaild)
		for k, v := range s.task {
			for _, val := range tempSubFaild {
				if val.UserId == v.UserId {
					s.task[k].TaskSubscribeStatusFailureCount = val.TaskSubscribeStatusFailureCount
					s.task[k].TaskSubscribeStatusWaitCount = s.task[k].TaskSubscribeCount - val.TaskSubscribeStatusFailureCount
				}
			}
		}
	}

	return s.task
}
func (s *Sub) get_sub_step_success() interface{} {

	delete(s.where, "status between ? and ?")
	s.where["status"] = server.SUBSCRIBE_STATUS_PASS
	subscribeSuccessResult, err := server.ModelTaskSubscribe.Get(s.where, "user_id, COUNT(id) as task_subscribe_status_success_count", "user_id", "")
	if err == nil {
		type tempSubsSuccess struct {
			UserId int32 `json:"user_id"`
			TaskSubscribeStatusSuccessCount int32 `json:"task_subscribe_status_success_count"`
		}
		var tempSubSuccess []tempSubsSuccess
		_ = subscribeSuccessResult.Structs(&tempSubSuccess)
		for k, v := range s.task {
			for _, val := range tempSubSuccess {
				if val.UserId == v.UserId {
					s.task[k].TaskSubscribeStatusSuccessCount = val.TaskSubscribeStatusSuccessCount
					s.task[k].TaskSubscribeStatusWaitCount = s.task[k].TaskSubscribeCount - val.TaskSubscribeStatusSuccessCount
				}
			}
		}
	}

	return s.task
}
func (s *Sub) get_sub_self_step_success() interface{} {

	s.where["merchant_id"] = s.where["user_id"]
	delete(s.where, "user_id")
	selfSubscribeSuccessResult, err := server.ModelTaskSubscribe.Get(s.where, "merchant_id as user_id, COUNT(id) as task_publish_children_success_count", "merchant_id", "")
	if err == nil {
		type tempSelfSubsSuccess struct {
			UserId int32 `json:"user_id"`
			TaskPublishChildrenSuccessCount int32 `json:"task_publish_children_success_count"`
		}
		var tempSubSelfSuccess []tempSelfSubsSuccess
		_ = selfSubscribeSuccessResult.Structs(&tempSubSelfSuccess)
		for k, v := range s.task {
			for _, val := range tempSubSelfSuccess {
				if val.UserId == v.UserId {
					s.task[k].TaskPublishChildrenSuccessCount = val.TaskPublishChildrenSuccessCount
					//s.task[k].TaskPublishChildrenWaitCount = s.task[k].TaskPublishChildrenCount - val.TaskPublishChildrenSuccessCount
				}
			}
		}
	}

	return s.task
}
func (s *Sub) get_sub_self_step_failure() interface{} {

	delete(s.where, "status")
	s.where["status between ? and ?"] = g.Slice{server.SUBSCRIBE_STATUS_REWAIT_FAILURE, server.SUBSCRIBE_STATUS_FAILURE}
	selfSubscribeFaildResult, err := server.ModelTaskSubscribe.Get(s.where, "merchant_id as user_id, COUNT(id) as task_publish_children_failure_count", "merchant_id", "")
	if err == nil {
		type tempSelfSubsFailures struct {
			UserId int32 `json:"user_id"`
			TaskPublishChildrenFailureCount int32 `json:"task_publish_children_failure_count"`
		}
		var tempSubSelfFailure []tempSelfSubsFailures
		_ = selfSubscribeFaildResult.Structs(&tempSubSelfFailure)
		for k, v := range s.task {
			for _, val := range tempSubSelfFailure {
				if val.UserId == v.UserId {
					s.task[k].TaskPublishChildrenFailureCount = val.TaskPublishChildrenFailureCount
					// s.task[k].TaskPublishChildrenWaitCount = s.task[k].TaskPublishChildrenCount - val.TaskPublishChildrenFailureCount
				}
			}
		}
	}

	return s.task
}


func user_get() (interface{}, error) {
	return g.Redis().Do("GET", redis.ADMIN_REPORT_COLLECT_TIME_DAY+help.TimeStrips(0,0,0).Format(help.TIME_FORMAT_DAY_OUT))
}
func user_set(tempIds interface{}) (interface{}, error) {
	return g.Redis().Do("SET", redis.ADMIN_REPORT_COLLECT_TIME_DAY + help.TimeStrips(0,0,0).Format(help.TIME_FORMAT_DAY_OUT), tempIds)
}

func collect_set(value interface{}) (interface{}, error) {
	return g.Redis().Do("SET", redis.ADMIN_REPORT_FLAG_TIME, value)
}
func collect_get() (interface{}, error) {
	return g.Redis().Do("GET", redis.ADMIN_REPORT_FLAG_TIME)
}

func step_money (bill []bills) g.List {

	gs := map[interface{}]interface{}{}
	for _, v := range bill {
		 if _, ok := gs[v.UserId]; ok == false {
			 gs[v.UserId] = &datas{}
		 }
		data := gs[v.UserId].(*datas)
		if data != nil {
			data.UserId = v.UserId
			if v.Type == byte(1){// 加钱 type=1
				if   v.Role == byte(1) {
					data.UserDepositCount = data.UserDepositCount + 1
					data.UserDepositMoneySum = data.UserDepositMoneySum + v.Amount
					if v.Amount > data.UserDepositMoneyMax {
						data.UserDepositMoneyMax = v.Amount
					}
				} else {
					data.UserDepositManualMoneyCount = data.UserDepositManualMoneyCount + 1
					data.UserDepositManualMoneySum = data.UserDepositManualMoneySum + v.Amount
					if v.Amount > data.UserDepositManualMoneyMax {
						data.UserDepositManualMoneyMax = v.Amount
					}
				}
			} else {// 减钱 type=2
				if   v.Role == byte(1) {
					// 普通 role = 1
					data.UserWithdrawCount = data.UserWithdrawCount + 1
					data.UserWithdrawMoneySum = data.UserWithdrawMoneySum + v.Amount
					if v.Amount > data.UserWithdrawMoneyMax {
						data.UserWithdrawMoneyMax = v.Amount
					}
				} else {
					// 人工 role = 2
					data.UserWithdrawManualMoneyCount = data.UserWithdrawManualMoneyCount + 1
					data.UserWithdrawManualMoneySum = data.UserWithdrawManualMoneySum + v.Amount
					if v.Amount > data.UserWithdrawManualMoneyMax {
						data.UserWithdrawManualMoneyMax = v.Amount
					}
				}
			}
		}
	}
	list := g.List{}
	for _, v := range gs {
		list = append(list, gconv.Map(v))
	}
	return list
}