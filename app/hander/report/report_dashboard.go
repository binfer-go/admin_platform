package report

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"platform/app/errcode"
	"platform/app/server"
	"platform/library/help"
	"platform/library/redis"
	"platform/library/response"
)
type DashInterface interface {
	Dashs() *ReportFilter
}

type ReportDashboard struct {}

type ReportFilter struct {
	ReportUser UserReport `json:"report_user"`
	ReportPublish TaskPublishReport `json:"report_publish"`
	ReportSubscribe TaskSubscribeReport `json:"report_subscribe"`
	ReportUserMoney MoneyUserReport `json:"report_user_money"`
}

type UserReport struct {
	UserReportTotal int `json:"user_report_total"`
	UserOnline int `json:"user_online"`
	UserTodayRegister int `json:"user_today_register"`
	UserYestodayRegister int `json:"user_yestoday_register"`
}
type TaskPublishReport struct {
	TaskPublishTotal int `json:"task_publish_total"`	// 任务总量
	TaskPublishChildTotal int `json:"task_publish_child_total"`// 任务内可接数量
	TaskTodayPublishTotal int `json:"task_today_publish_total"` // 今日任务量
	TaskTodayPublishChildTotal int `json:"task_today_publish_child_total"` // 今日任务内可接数量
	TaskYestodayPublishTotal int `json:"task_yestoday_publish_total"`	// 昨日任务量
	TaskYestodayPublishChildTotal int `json:"task_yestoday_publish_child_total"` // 昨日任务内可接数量
	TaskPersionPulbishTotal int `json:"task_persion_pulbish_total"` // 发布人数
}
type TaskSubscribeReport struct {
	TaskSubscribeTotal int `json:"task_subscribe_total"`
	TaskTodaySubscribe int `json:"task_today_subscribe"`
	TaskYestodaySubscribe int `json:"task_yestoday_subscribe"`
	TaskCurrentValidTotal int `json:"task_current_valid_total"`
}
type MoneyUserReport struct {
	MoneyUserBalanceTotal float64 `json:"money_user_balance_total"`
	MoneyTodayDepositMoney float64 `json:"money_today_deposit_money"`
	MoneyTodayCommissionMoney float64 `json:"money_today_commission_money"`
	MoneyTodayWithdrawMoney float64 `json:"money_today_withdraw_money"`
}



/**
 * @api {get} /v1/report_dashboards  控制台数据看板
 * @apiVersion 0.1.0
 * @apiName  报表
 * @apiGroup 报表管理 Report
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
 {
	"code": 200,
	"data": {
	"report_user": {
		"user_report_total": 6, 	# {Integer}	会员数
		"user_online": 0, 		# {Integer}	在线人数
		"user_today_register": 0, 	# {Integer}	今日注册人数
		"user_yestoday_register": 0	# {Integer}	昨日注册人数
	},
	"report_publish": {
		"task_publish_total": 1,		# {Integer}	任务总数/8963
		"task_publish_child_total": 5,		# {Integer}	56/任务子集总数
		"task_today_publish_total": 0,		# {Integer}	今日任务总数/546
		"task_today_publish_child_total": 0,	# {Integer}	6/今日任务子集总数
		"task_yestoday_publish_total": 0,	# {Integer}	昨日任务总数/998
		"task_yestoday_publish_child_total": 0,	# {Integer}	9/昨日任务子集总数
		"task_persion_pulbish_total": 1		# {Integer}	发布人数
	},
	"report_subscribe": {
		"task_subscribe_total": 0,		# {Integer}	完成量
		"task_today_subscribe": 0,		# {Integer}	今日完成量
		"task_yestoday_subscribe": 0,		# {Integer}	昨日完成量
		"task_current_valid_total": 3		# {Integer}	当前剩余任务数
	},
	"report_user_money": {
		"money_user_balance_total": 0,		# {Float64}	会员累计金额
		"money_today_deposit_money": 0,		# {Float64}	会员今日存款
		"money_today_commission_money": 0,	# {Float64}	会员今日佣金
		"money_today_withdraw_money": 0		# {Float64}	会员今日取款
	}
 	},
	"msg": "成功"
 }
 * @apiErrorExample Error-Response:
 {
     "code": 201,
     "data": null
     "msg": "失败提示",
 }
*/
func (*ReportDashboard)Get(req *ghttp.Request)  {

	// 会员			- 总人数					- 实时在线	- 今日注册	- 昨日注册
	// 任务			- 有效任务数/总任务数		- 今日发布	- 昨日发布	- 发布人数 ?
	// 任务完成量	- 任务完成总量			- 今日完成	- 昨日完成	- 当前余量 ?
	// 当前余额?		- 总余额					- 今日充值	- 今日佣金	- 今日提现
	var report ReportFilter
	report.ReportUserMoney.Dashs()
	report.ReportSubscribe.Dashs()
	report.ReportPublish.Dashs()
	report.ReportUser.Dashs()
	response.Json(req, errcode.ErrCodeSuccess, "", report)

}

func (report *MoneyUserReport) Dashs () *MoneyUserReport  {
	// 当前余额
	report.MoneyUserBalanceTotal = help.Decimal(server.ModelUser.GetSum(""))
	// 今日充值
	where_today_deposit := g.Map{}
	where_today_deposit["type"] = server.ADMIN_BILL_TYPE_GOLD_ADD
	where_today_deposit["operate"] = server.ADMIN_BILL_OPERATE_STATUS_DEPOSIT
	where_today_deposit["created_at between ? and ?"] = g.Slice{help.TimeStrips(0,0, 0), help.TimeStrips(0,0,1)}
	report.MoneyTodayDepositMoney = help.Decimal(server.ModelBill.GetSum(where_today_deposit))
	// 今日佣金
	where_today_commission := g.Map{}
	where_today_commission["type"] = server.ADMIN_BILL_TYPE_GOLD_ADD
	where_today_commission["operate"] = server.ADMIN_BILL_OPERATE_STATUS_TASK_COMMISSION
	where_today_commission["created_at between ? and ?"] = g.Slice{help.TimeStrips(0,0, 0), help.TimeStrips(0,0,1)}
	report.MoneyTodayCommissionMoney = help.Decimal(server.ModelBill.GetSum(where_today_commission))
	// 今日提现
	where_today_withdraw := g.Map{}
	where_today_withdraw["type"] = server.ADMIN_BILL_TYPE_GOLD_DEL
	where_today_withdraw["operate"] = server.ADMIN_BILL_OPERATE_STATUS_WITHDRAW
	where_today_withdraw["created_at between ? and ?"] = g.Slice{help.TimeStrips(0,0, 0), help.TimeStrips(0,0,1)}
	report.MoneyTodayWithdrawMoney = help.Decimal(server.ModelBill.GetSum(where_today_withdraw))
	return report
}

func (report *TaskSubscribeReport) Dashs () *TaskSubscribeReport  {
	// 任务完成总量
	report.TaskSubscribeTotal  = server.ModelTaskSubscribe.GetCount(g.Map{"status" : server.SUBSCRIBE_STATUS_PASS})
	// 今日完成量
	report.TaskTodaySubscribe = server.ModelTaskSubscribe.GetCount(g.Map{
		"status" : server.SUBSCRIBE_STATUS_PASS,
		"created_at between ? and ?":g.Slice{help.TimeStrips(0,0, 0), help.TimeStrips(0,0,1)}})
	// 昨日完成量
	report.TaskYestodaySubscribe = server.ModelTaskSubscribe.GetCount(g.Map{
		"status" : server.SUBSCRIBE_STATUS_PASS,
		"created_at between ? and ?":g.Slice{help.TimeStrips(0,0, -1), help.TimeStrips(0,0,0)}})
	// 当前余量：
	report.TaskCurrentValidTotal = server.ModelTaskPublish.GetSum(nil, "SUM(count)-SUM(accept) as sums")
	return report
}


func (report *UserReport) Dashs () *UserReport  {

	// 总人数
	report.UserReportTotal = server.ModelUser.GetCount("")
	// 在线人数
	user_token_count, err := g.Redis().Do("keys", redis.USER_TOKEN_STATUS)
	if err != nil {
		report.UserOnline = gconv.Int(user_token_count)
	}
	// 今日注册
	report.UserTodayRegister  	= server.ModelUser.GetCount(g.Map{
		"created_at between ? and ?":g.Slice{help.TimeStrips(0,0, 0), help.TimeStrips(0,0,1)}})
	// 昨日注册
	report.UserYestodayRegister = server.ModelUser.GetCount(g.Map{
		"created_at between ? and ?":g.Slice{help.TimeStrips(0,0, -1), help.TimeStrips(0,0,0)}})
	return report

}

func (report *TaskPublishReport) Dashs () *TaskPublishReport  {

	// 总任务数量 : 排除拒绝任务类型
	report.TaskPublishTotal = server.ModelTaskPublish.GetCount(nil)
	// 任务子级数量
	report.TaskPublishChildTotal = server.ModelTaskPublish.GetSum(nil, "")
	// 今日发布任务数
	report.TaskTodayPublishTotal = server.ModelTaskPublish.GetCount(g.Map{
		"created_at between ? and ?":g.Slice{help.TimeStrips(0,0, 0), help.TimeStrips(0,0,1)}})
	// 今日发布任务子级数量
	report.TaskTodayPublishChildTotal = server.ModelTaskPublish.GetSum(g.Map{
		"created_at between ? and ?" : g.Slice{help.TimeStrips(0,0, 0), help.TimeStrips(0,0,1)},
	}, "")

	// 昨日发布任务数量
	report.TaskYestodayPublishTotal = server.ModelTaskPublish.GetCount(g.Map{
		"created_at between ? and ?":g.Slice{help.TimeStrips(0,0, -1), help.TimeStrips(0,0,0)}})
	// 昨日发布任务子级数量
	report.TaskYestodayPublishChildTotal = server.ModelTaskPublish.GetSum(g.Map{
		"created_at between ? and ?" : g.Slice{help.TimeStrips(0,0, -1), help.TimeStrips(0,0,0)},
	}, "")
	// 总发布人数
	report.TaskPersionPulbishTotal = server.ModelTaskPublish.DistinctCounts("", "DISTINCT user_id")

	return report
}

type Req struct {
	Day int `json:"day"`
}


type Mod struct{
	Days []string `json:"days"`
	Reg []int `json:"reg"`
	Pub []int `json:"pub"`
	Sub []int `json:"sub"`
}
func GetUserReport()  {

	var day Req
	/*if err := req.Parse(&day); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}*/
	day.Day = 7
	var m Mod
	type temps struct {
		Count int `json:"count"`
		Days string `json:"days"`
	}

	for i := 7; i>=0; i-- {
		m.Days = append(m.Days,  help.TimeStrips(0,0, -i).Format("20060102"))
		m.Reg  = append(m.Reg, 0)
		m.Pub  = append(m.Pub, 0)
		m.Sub  = append(m.Sub, 0)
	}
	// 注册会员
	where_user := g.Map{}
	where_user["DATE_FORMAT(created_at,'%Y%m%d')"] = m.Days
	user, _ := server.ModelUser.Get(where_user,"COUNT(DISTINCT id) as count, DATE_FORMAT(created_at,'%Y%m%d') as days", "created_at", "")
	var tempUser []temps
	_ = user.Structs(&tempUser)
	for _, v := range tempUser {
		for k,vv := range m.Days {
			if v.Days == vv {
				m.Reg[k] = v.Count
			}
		}
	}
	g.Dump(m)


}