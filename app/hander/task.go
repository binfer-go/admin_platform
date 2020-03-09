package hander

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/server"
	"platform/library/help"
	"platform/library/response"
	"time"
)

type Task struct {}

type postAddTaskReq struct {
	Title     string    `json:"title"`
	Describe  string    `json:"describe"`
	Status    byte      `json:"status"`
	Sort      int32     `json:"sort"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type putEditTaskReq struct {
	Id int32 `json:"id"`
	Title     string    `json:"title"`
	Describe  string    `json:"describe"`
	Status    byte      `json:"status"`
	Sort      int32     `json:"sort"`
	UpdatedAt time.Time `json:"updated_at"`
}

type getListTaskReq struct {
	Id int32 `json:"id"`
	Title string `json:"title"`
	Status int `json:"status"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}




/**
 * @api {get} /v1/task  任务类型列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 任务类型 Task
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			Id查询详情
 * @apiParam {String}  title		标题
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {Integer} status		状态 {config: task_status}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id        int32     `plat:"primary_key;id" json:"id"`
		Title     string    `plat:"title" json:"title"`           // 任务标题
		Describe  string    `plat:"describe" json:"describe"`     // 任务描述
		Status    byte      `plat:"status" json:"status"`         // 1:启用 2:禁用
		Sort      int32     `plat:"sort" json:"sort"`             // 排序
		CreatedAt time.Time `plat:"created_at" json:"created_at"` // 创建时间
		UpdatedAt time.Time `plat:"updated_at" json:"updated_at"` // 更新时间
		},
		"msg": "成功",
		"page": {
			"TotalPage": 1,		#总页数
			"TotalSize": 1,		#总条数
			"CurrentPage": 1,	#当前页码
			"PageBarNum": 10	#分页标识
		}
	}
 * @apiErrorExample Error-Response:
 *  {
 *     "code": 201,
 *     "data": null
 *     "msg": "失败提示",
 *  }
 */
func (task *Task) Get (req *ghttp.Request)  {
	var list getListTaskReq

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
	if list.Title != "" {
		where["title"] = list.Title
	}
	if list.Id > 0 {
		where["id"] = list.Id
	}
	result, pages, _ := server.ModelTask.GetPageList(where, list.Page, list.PageSize);

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {post} /v1/task  创建任务类型
 * @apiVersion 0.1.0
 * @apiName  添加
 * @apiGroup 任务类型 Task
 * @apiParam {String}  title		标题
 * @apiParam {String}  describe		描述
 * @apiParam {Integer} sort			排序
 * @apiParam {Integer} status		状态 0：启用 1：禁用
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1000000006,
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (task *Task) Post (req *ghttp.Request)  {
	var add postAddTaskReq

	err := req.Parse(&add)
	if err != nil {

		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	add.CreatedAt = time.Now()
	add.UpdatedAt = time.Now()
	status, err := server.ModelTask.Create(add)

	if err != nil {
		response.Json(req, errcode.ErrCodeCreateTaskError, "")
	}
	log, _ := json.Marshal(&add)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Action = server.ADMIN_LOG_ACTION_CREATE
		options.Title  = env.F[env.ADMIN_MODULE_TASK]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess,"", status)

}

/**
 * @api {put} /v1/task   更新任务类型
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 任务类型 Task
 * @apiParam {Integer} id		  * 任务Id
 * @apiParam {String}  title		标题
 * @apiParam {String}  describe		描述
 * @apiParam {Integer} sort			排序
 * @apiParam {Integer} status		状态 0：启用 1：禁用
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
func (task *Task) Put (req *ghttp.Request)  {
	var edit putEditTaskReq

	id := req.GetInt32("id", 0)
	if id == 0 {

		response.Json(req, errcode.ErrCodeUpdateTaskError, "")
	}
	info, err := server.ModelTask.GetById(id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeUpdateTaskNotExist, "")
	}
	if err := req.Parse(&edit); err != nil {

		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}

	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	status, err := server.ModelTask.Update(id, data)
	if err != nil || status != nil {
		log, _ := json.Marshal(&edit)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Action = server.ADMIN_LOG_ACTION_UPDATE
			options.Title  = env.F[env.ADMIN_MODULE_TASK]
			options.Description = string(log)
			options.ActionAdminId = Admins.Id
			options.ActionAdminName = Admins.Account
			options.ActionAdminIp = req.GetClientIp()
		})
	}
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}






