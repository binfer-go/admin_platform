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

type TaskPublish struct {}

type getListTaskPublishReq struct {

	Id int32 `json:"id"`
	Status int `json:"status"`			// 0:待发布 1:待审核 2:已通过 3:已拒绝 4:已关闭 5:已删除
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

type putEditTaskPublishReq struct {
	Id int32 `json:"id"`
	Project   string    `json:"project"`
	Title     string    `json:"title"`
	Describe  string    `json:"describe"`
	Link  	  string    `json:"link"`
	LimitCount int32 	`json:"limit_count"`
	Count 	  int32 	`json:"count"`
	Status    byte      `json:"status"`
	ExpireTs  int64     `json:"expire_ts"`
	InspectTs int64     `json:"inspect_ts"`
	StartTime time.Time `json:"start_time"`
	FinishTime time.Time `json:"finish_time"`
	UpdatedAt time.Time `json:"updated_at"`
}

type patchActionTaskPublishReq struct {}

/**
 * @api {get} /v1/task_publish  发布任务列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 发布任务 Publish
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			Id查询详情
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {Integer} status		任务状态 {1:待发布 2:待审核 3:已通过 4:已拒绝 5:已关闭 6:已删除} {config: task_publish_status}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id                int32     `plat:"primary_key;id" json:"id"`
		UserId            int32     `plat:"user_id" json:"user_id"`                       // 用户ID
		Username          string    `plat:"username" json:"username"`                     // 用户名
		Avatar            string    `plat:"avatar" json:"avatar"`                         // 用户头像
		TaskType          byte      `plat:"task_type" json:"task_type"`                   // 任务类型ID
		Project           string    `plat:"project" json:"project"`                       // 项目名称
		Title             string    `plat:"title" json:"title"`                           // 任务标题
		Describe          string    `plat:"describe" json:"describe"`                     // 任务描述
		Link              string    `plat:"link" json:"link"`                             // 任务链接
		Amount            int32     `plat:"amount" json:"amount"`                         // 任务金额
		Accept            int32     `plat:"accept" json:"accept"`                         // 做单人数
		Commit            int32     `plat:"commit" json:"commit"`                         // 待审核人数
		Success           int32     `plat:"success" json:"success"`                       // 已通过人数
		Count             int32     `plat:"count" json:"count"`                           // 任务数量
		AdminAccount      string    `plat:"admin_account" json:"admin_account"`           // 操作人账号
		Step              string    `plat:"step" json:"step"`                             // 任务步骤
		Status            byte      `plat:"status" json:"status"`                         // 1:待发布 2:待审核3:已通过 4:已拒绝 5:已结束
		RefuseRemark      string    `plat:"refuse_remark" json:"refuse_remark"`           // 拒绝原因
		UnavailableRemark string    `plat:"unavailable_remark" json:"unavailable_remark"` // 禁用原因
		ExpireTs          int64     `plat:"expire_ts" json:"expire_ts"`                   // 过期时间
		InspectTs         int64     `plat:"inspect_ts" json:"inspect_ts"`                 // 检查时间
		StartTs           int64     `plat:"start_ts" json:"start_ts"`                     // 任务开始时间
		FinishTs          int64     `plat:"finish_ts" json:"finish_ts"`                   // 任务结束时间
		CreatedAt         time.Time `plat:"created_at" json:"created_at"`                 // 创建时间
		UpdatedAt         time.Time `plat:"updated_at" json:"updated_at"`                 // 更新时间
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
func (*TaskPublish)Get(req *ghttp.Request)  {
	var list getListTaskPublishReq

	where := g.Map{}
	if err := req.Parse(&list); err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if list.Start_time.Unix() > 0 {
		if list.Start_time.Unix() < list.End_time.Unix() {
			where["created_at between ? and ?"] = g.Slice{list.Start_time, list.End_time}
		} else {
			response.Json(req, errcode.ErrCodeTimeError, "")
		}
	}
	if list.Status > 0 {
		where["status"] = list.Status
	}
	if list.Id > 0 {
		where["id"] = list.Id
	}
	result, pages, _ := server.ModelTaskPublish.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {put} /v1/task_publish   更新发布任务
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 发布任务 Publish
 * @apiParam {Integer} id			  * 发布任务Id  - {status==1 or 3，才可以修改}
 * @apiParam {String}  project			项目名称
 * @apiParam {String}  title			标题
 * @apiParam {String}  describe			描述
 * @apiParam {String}  link				url
 * @apiParam {Integer} limit_count		任务限制人数
 * @apiParam {Integer} count			已领人数
 * @apiParam {Integer} status			任务状态：{1:待发布 2:待审核 3:已通过 4:已拒绝 5:已关闭 6:已删除}
 * @apiParam {Integer} expire_ts		过期时间
 * @apiParam {Integer} inspect_ts		检查时间
 * @apiParam {String}  start_time		开始时间
 * @apiParam {String}  finish_time		结束时间
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
func (*TaskPublish) Put (req *ghttp.Request)  {
	var edit putEditTaskPublishReq

	id := req.GetInt32("id", 0)
	if id == 0 {
		response.Json(req, errcode.ErrCodeUpdateTaskError, "")
	}
	info, err := server.ModelTaskPublish.GetById(id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeUpdateTaskNotExist, "")
		return
	}
	if err := req.Parse(&edit); err != nil {

		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	var modelTaskPublish model.TaskPublish
	_ = info.Struct(&modelTaskPublish)
	// 待发布 or 已拒绝的任务单才可以修改
	if modelTaskPublish.Status > 0 && modelTaskPublish.Status != server.PUBLISH_STATUS_WAIT || modelTaskPublish.Status != server.PUBLISH_STATUS_REFUSE {
		response.Json(req, errcode.ErrCodePublishPassError, "")
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	result, err := server.ModelTaskPublish.Update(id, data)
	if err != nil {
		response.Json(req, errcode.ErrCodeUpdateTaskError, "")
	}
	log, _ := json.Marshal(&edit)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Action = server.ADMIN_LOG_ACTION_UPDATE
		options.Title  = env.F[env.ADMIN_MODULE_TASK_PUBLISH]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess, "", result)

}




/**
 * @api {patch} /v1/task_publish   锁定/解锁发布任务
 * @apiVersion 0.1.0
 * @apiName  行为
 * @apiGroup 发布任务 Publish
 * @apiParam   {Integer}   id	* 任务Id
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
func (*TaskPublish) Patch (req *ghttp.Request)  {
	id   := req.GetInt32("id", 0)

	if id == 0 {
		response.Json(req, errcode.ErrCodeUpdateTaskNotExist, "")
	}
	info, err := server.ModelTaskPublish.GetById(id)
	if err != nil || info == nil {
		response.Json(req, errcode.ErrCodeUpdateTaskNotExist, "")
		return
	}
	var modelTaskPublish model.TaskPublish
	_ = info.Struct(&modelTaskPublish)
	if modelTaskPublish.AdminAccount == "" {
		modelTaskPublish.AdminAccount = Admins.Account
	} else if modelTaskPublish.AdminAccount != Admins.Account {
		response.Json(req, errcode.ErrCodeOrderTaskLockError, "")
	} else {
		modelTaskPublish.AdminAccount = ""
	}
	if modelTaskPublish.Step == "" {
		modelTaskPublish.Step = "{}"
	}
	modelTaskPublish.UpdatedAt = time.Now()
	status, err := server.ModelTaskPublish.Update(id, modelTaskPublish)
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}