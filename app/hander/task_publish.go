package hander

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gconv"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/hander/env/rpc"
	"platform/app/model"
	"platform/app/server"
	"platform/library/redis"
	"platform/library/response"
	"time"
)

type TaskPublish struct {}

type getListTaskPublishReq struct {

	Id int32 `json:"id"`
	Status int `json:"status"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

type putEditTaskPublishReq struct {
	Id int32 `json:"id"`
	Status byte      `json:"status"`
	Rate   float64 `json:"rate"`
	RefuseRemark string `json:"refuse_remark"`
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
 * @apiParam {Integer} status		任务状态  {config: task_publish_status}
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
	Status            byte      `plat:"status" json:"status"`                         // {config: task_publish_status} 1:待发布 2:待审核3:已通过 4:已拒绝 5:已结束
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
 * @api {put} /v1/task_publish   更新发布任务（审核）
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 发布任务 Publish
 * @apiParam {Integer} id			  * 发布任务Id {status == 2, 才可以审核}
 * @apiParam {Integer} status		  *	任务状态：{3: 通过 4：未通过}
 * @apiParam {Float}   rate	  		  *	费率
 * @apiParam {String}  refuse_remark	备注
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

	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	lockName := redis.ADMIN_LOCK_TIME_TASK_PUBLISH+gconv.String(edit.Id)
	ts := redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, nil)
	if ts != 0 {
		response.Json(req, errcode.ErrCodeFailure, fmt.Sprintf("请不要频繁操作, 剩余时间: %v 秒.", ts))
	}
	if edit.Id == 0 {
		response.Json(req, errcode.ErrCodeUpdateTaskError, "")
	}
	info, err := server.ModelTaskPublish.GetById(edit.Id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeUpdateTaskNotExist, "")
		return
	}

	var modelTaskPublish model.TaskPublish
	_ = info.Struct(&modelTaskPublish)
	if modelTaskPublish.AdminAccount != Admins.Account {
		response.Json(req, errcode.ErrCodeLockError, "")
	}

	if modelTaskPublish.Status == server.PUBLISH_STATUS_INSPECTION {
		var status bool
		if edit.Status == server.PUBLISH_STATUS_PASS {
			status = true
		} else if edit.Status == server.PUBLISH_STATUS_REFUSE {
			status = false
		}
		// 锁定订单
		redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, time.Now())

		ctx, _ := context.WithTimeout(context.TODO(), time.Second * 3)
		_, err := rpc.GrpcConn().TaskInspect(ctx, &rpc.TaskVerifyRequest{
			Id:                   edit.Id,
			Status:               status,
			Remark:               edit.RefuseRemark,
			Rate:                 edit.Rate,
		})
		if err != nil {
			glog.Level(glog.LEVEL_ERRO).Printf("--10011 - 审核发布任务成功,", &rpc.TaskVerifyRequest{})
			response.Json(req, errcode.ErrCodeFailure, err.Error())
		} else {
			log, _ := json.Marshal(&edit)
			server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
				options.Action = server.ADMIN_LOG_ACTION_UPDATE
				options.Title  = env.F[env.ADMIN_MODULE_TASK_PUBLISH]
				options.Description = string(log)
				options.ActionAdminId = Admins.Id
				options.ActionAdminName = Admins.Account
				options.ActionAdminIp = req.GetClientIp()
			})
			glog.Level(glog.LEVEL_ERRO).Printf("--10011 - 审核发布任务成功,", &rpc.TaskVerifyRequest{})
			response.Json(req, errcode.ErrCodeSuccess, "", edit)
		}
	} else {
		response.Json(req, errcode.ErrCodeFailure, "")
	}



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