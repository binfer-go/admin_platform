package hander

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
	"platform/library/response"
	"time"
)

type TaskSubscribe struct {}

type getListTaskSubscribeReq struct {
	Status int `json:"status"`			// 0:待发布 1:待审核 2:已通过 3:已拒绝 4:已关闭 5:已删除
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
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {Integer} status		任务状态：{0:进行中 1:已提交 2:已拒绝 3:重新提交 4:已结算}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
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

	result, pages, _ := server.ModelTaskSubscribe.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {put} /v1/task_subscribe   更新接单任务
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 接单任务 Subscribe
 * @apiParam {Integer} id		* 接单任务Id	- {status == 2, 才可以修改}
 * @apiParam {Integer} status	  任务状态：{1:进行中 2:已提交 3:已拒绝 4:重新提交 5:已结算}
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
		response.Json(req, errcode.ErrCodeUpdateTaskError, "解析失败")
	}
	var modelTaskSubscribe model.TaskSubscribe
	_ = info.Struct(&modelTaskSubscribe)
	// 拒绝的任务才可以修改
	if modelTaskSubscribe.Status > 0 && modelTaskSubscribe.Status != server.SUBSCRIBE_STATUS_REFUSE {
		response.Json(req, errcode.ErrCodeSubscribePassError, "")
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	result, err := server.ModelTaskSubscribe.Update(id, data)

	response.Json(req, errcode.ErrCodeSuccess, "", result)

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