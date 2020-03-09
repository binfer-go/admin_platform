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

type bills struct {
	UserId int32 `json:"user_id"`
	Amount int32 `json:"amount"`
	Operate byte `json:"operate"`
	Role byte `json:"role"`
	Type byte `json:"type"`
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

func (*Pull) PullBills()  {
	userRedis, _ := user_get()
	if userRedis == nil {
		glog.Level(glog.LEVEL_INFO).Println("--- 今日尚未有会员登陆, 拉取账单信息失败. -------\n")
		return
	}
	var start_time string
	interVal, _ := collect_get()
	if interVal != nil {
		start_time = gconv.Time(interVal).Format(help.TIME_FORMAT_OUT)
	} else {
		start_time = time.Now().Format(help.TIME_FORMAT_OUT)
	}
	glog.Level(glog.LEVEL_INFO).Println("--- 本次账单同步时间: "+ start_time + " -------")
	_, _ = collect_set(time.Now().Format(help.TIME_FORMAT_OUT))// 存储本次查询时间标记
	ids := g.Slice{}
	_ = json.Unmarshal(gconv.Bytes(userRedis), &ids)
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
		glog.Level(glog.LEVEL_NOTI).Println("-- 同步账单流水成功..\n", sql)
	}


}


func (*Pull) PullUser ()  {
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
					glog.Level(glog.LEVEL_INFO).Println("-- 用户数据报表更新成功..\n", sql)
				}
			}
		}
	}
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