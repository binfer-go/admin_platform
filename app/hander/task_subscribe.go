package hander

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
	"platform/library/response"
	"time"
)

type TaskSubscribe struct {}

type getListTaskSubscribeReq struct {
	Id int32 `json:"id"`
	Status byte `json:"status"`			// 0:待发布 1:待审核 2:已通过 3:已拒绝 4:已关闭 5:已删除
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

type putEditTaskSubscribeReq struct {
	Id int32 `json:"id"`
	Status    byte      `json:"status"`
	Remark    string    `json:"remark"`
	UpdatedAt time.Time `json:"updated_at"`
}

type patchActionTaskSubscribeReq struct {}


/**
 * @api {get} /v1/task_subscribe  接单任务列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 接单任务 Subscribe
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			Id查询详情
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {Integer} status		任务状态：{ 1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:复审失败 7:已过期} {config: task_subscribe_status}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id              int32     `plat:"primary_key;id" json:"id"`
		TaskId          int32     `plat:"task_id" json:"task_id"`                   // 任务id
		TaskType        byte      `plat:"task_type" json:"task_type"`               // 任务类型
		Project         string    `plat:"project" json:"project"`                   // 项目名称
		MerchantId      int32     `plat:"merchant_id" json:"merchant_id"`           // 卖家ID
		MerchantName    string    `plat:"merchant_name" json:"merchant_name"`       // 卖家账号
		MerchantAvatar  string    `plat:"merchant_avatar" json:"merchant_avatar"`   // 卖家头像
		UserId          int32     `plat:"user_id" json:"user_id"`                   // 买家ID
		UserName        string    `plat:"user_name" json:"user_name"`               // 买家账号
		Amount          int32     `plat:"amount" json:"amount"`                     // 任务佣金
		Step            string    `plat:"step" json:"step"`                         // 任务步骤
		Result          string    `plat:"result" json:"result"`                     // 任务提交凭证
		Status          byte      `plat:"status" json:"status"`                     // 1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:复审失败 7:已过期
		AdminAccount    string    `plat:"admin_account" json:"admin_account"`       // 操作人账号
		AcceptTs        int64     `plat:"accept_ts" json:"accept_ts"`               // 领取时间
		CommitTs        int64     `plat:"commit_ts" json:"commit_ts"`               // 提交时间
		VerifyTs        int64     `plat:"verify_ts" json:"verify_ts"`               // 审核时间
		ReportTs        int64     `plat:"report_ts" json:"report_ts"`               // 复审提交时间
		ReportReason    string    `plat:"report_reason" json:"report_reason"`       // 复审举报理由
		ReverifyTs      int64     `plat:"reverify_ts" json:"reverify_ts"`           // 复审时间
		ReverifyRemark  string    `plat:"reverify_remark" json:"reverify_remark"`   // 复审备注
		ReverifyAccount string    `plat:"reverify_account" json:"reverify_account"` // 复审处理人 为空则为商家处理
		ExpireTs        int64     `plat:"expire_ts" json:"expire_ts"`               // 过期时间
		InspectTs       int64     `plat:"inspect_ts" json:"inspect_ts"`             // 审核周期
		AutoCompleteTs  int64     `plat:"auto_complete_ts" json:"auto_complete_ts"` // 自动完成时间
		CommitMsg       string    `plat:"commit_msg" json:"commit_msg"`             // 订单提交信息
		RefuseMsg       string    `plat:"refuse_msg" json:"refuse_msg"`             // 拒绝理由
		Remark          string    `plat:"remark" json:"remark"`                     // 订单备注
		CreatedAt       time.Time `plat:"created_at" json:"created_at"`             // 创建时间
		UpdatedAt       time.Time `plat:"updated_at" json:"updated_at"`             // 更新时间
		},
		"msg": "成功",
		"page": {
			"TotalPage": 1,
			"TotalSize": 1,
			"CurrentPage": 1,
			"PageBarNum": 10
		}
	}
 * @apiErrorExample Error-Response:
 *  {
 *     "code": 201,
 *     "data": null
 *     "msg": "失败提示",
 *  }
*/
func (*TaskSubscribe)Get(req *ghttp.Request)  {
	var list getListTaskSubscribeReq

	where := g.Map{}
	if err := req.Parse(&list); err != nil {
		response.Json(req, errcode.ErrCodeFailure, "1")
	}
	if list.Start_time.Unix() > 0 {
		if list.Start_time.Unix() < list.End_time.Unix() {
			where["created_at between ? and ?"] = g.Slice{list.Start_time, list.End_time}
		} else {
			response.Json(req, errcode.ErrCodeTimeError, "2")
		}
	}
	if list.Status > 0 {
		where["status"] = list.Status
	}
	if list.Id > 0 {
		where["id"] = list.Id
	}
	result, pages, _ := server.ModelTaskSubscribe.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {put} /v1/task_subscribe   更新接单任务
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 接单任务 Subscribe
 * @apiParam {Integer} id		* 接单任务Id	- {status == 2, 才可以修改}
 * @apiParam {Integer} status	  任务状态：{ 1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:复审失败 7:已过期}
 * @apiParam {String}  remark	  备注
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1,
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*TaskSubscribe) Put (req *ghttp.Request)  {
	var edit putEditTaskSubscribeReq

	id := req.GetInt32("id", 0)
	if id == 0 {
		response.Json(req, errcode.ErrCodeUpdateTaskError, "")
	}
	info, err := server.ModelTaskSubscribe.GetById(id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeUpdateTaskNotExist, "")
		return
	}
	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	var modelTaskSubscribe model.TaskSubscribe
	_ = info.Struct(&modelTaskSubscribe)
	// 拒绝的任务才可以修改
	if modelTaskSubscribe.Status > 0 && modelTaskSubscribe.Status != server.SUBSCRIBE_STATUS_REFUSE {
		response.Json(req, errcode.ErrCodeSubscribePassError, "")
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	status, err := server.ModelTaskSubscribe.Update(id, data)
	if err != nil || status != nil {
		log, _ := json.Marshal(&edit)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Action = server.ADMIN_LOG_ACTION_UPDATE
			options.Title  = env.F[env.ADMIN_MODULE_TASK_SUBSCRIBE]
			options.Description = string(log)
			options.ActionAdminId = Admins.Id
			options.ActionAdminName = Admins.Account
			options.ActionAdminIp = req.GetClientIp()
		})
	}
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}


/**
 * @api {patch} /v1/task_subscribe   锁定/解锁接单任务
 * @apiVersion 0.1.0
 * @apiName  行为
 * @apiGroup 接单任务 Subscribe
 * @apiParam {Integer} 	   id	* 任务Id
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1,
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*TaskSubscribe) Patch (req *ghttp.Request)  {
	id   := req.GetInt32("id", 0)

	if id == 0 {
		response.Json(req, errcode.ErrCodeUpdateTaskNotExist, "")
	}
	info, err := server.ModelTaskSubscribe.GetById(id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeUpdateTaskNotExist, "")
		return
	}
	var modelTaskSubscribe model.TaskSubscribe
	_ = info.Struct(&modelTaskSubscribe)
	if modelTaskSubscribe.AdminAccount == "" {
		modelTaskSubscribe.AdminAccount = Admins.Account
	} else if modelTaskSubscribe.AdminAccount != Admins.Account {
		response.Json(req, errcode.ErrCodeOrderTaskLockError, "")
	} else {
		modelTaskSubscribe.AdminAccount = ""
	}
	if modelTaskSubscribe.Step == "" {
		modelTaskSubscribe.Step = "{}"
	}
	modelTaskSubscribe.UpdatedAt= time.Now()
	status, err := server.ModelTaskSubscribe.Update(id, modelTaskSubscribe)

	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}