package hander

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/server"
	"platform/library/response"
	"time"
)

type SiteAdminLog struct {}

type getListAdminLogReq struct {
	Id int32 `json:"id"`
	Level byte `json:"level"`
	Module byte `json:"module"`
	Action byte `json:"action"`
	ActionAdminName string `json:"action_admin_name"`
	ActionUserName string `json:"action_user_name"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

/**
 * @api {Get} /v1/site_admin_log 管理员日志列表
 * @apiVersion 0.1.0
 * @apiName  日志
 * @apiGroup 日志 SiteLogs
 * @apiParam {Integer}  module	模型 {config: site_admin_log_model}
 * @apiParam {Integer}  action	行为 {config: site_admin_log_action}
 * @apiParam {Integer}  level	等级 {config: site_admin_log_level}
 * @apiParam {Integer}  start_time   	开始时间
 * @apiParam {Integer}  end_time		结束时间
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": null,
		"remark: {
		Id              int32     `plat:"primary_key;id" json:"id"`
		Level           byte      `plat:"level" json:"level"`                         // 日志等级 1:普通 2：警告 3：严重
		Module          byte      `plat:"module" json:"module"`                       // 模块
		Action          byte      `plat:"action" json:"action"`                       // 行为：1:create，2:update，3:delete，4:select，5:other
		Title           string    `plat:"title" json:"title"`                         // 标题
		Description     string    `plat:"description" json:"description"`             // 描述
		ActionAdminId   int32     `plat:"action_admin_id" json:"action_admin_id"`     // 管理员ID
		ActionAdminName string    `plat:"action_admin_name" json:"action_admin_name"` // 管理员账户
		ActionUserId    int32     `plat:"action_user_id" json:"action_user_id"`       // 被操作人ID
		ActionUserName  string    `plat:"action_user_name" json:"action_user_name"`   // 被操作人账户
		ActionAdminIp   string    `plat:"action_admin_ip" json:"action_admin_ip"`     // 操作者ip
		CreatedAt       time.Time `plat:"created_at" json:"created_at"`               // 创建时间
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
func (*SiteAdminLog) Get (req *ghttp.Request)  {
	var list getListAdminLogReq

	where := g.Map{}
	if err := req.Parse(&list); err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if list.Id > 0 {
		where["id"]= list.Id
	}
	if list.Level >=  server.ADMIN_LOG_LEVEL_INFO {
		where["level"]= list.Level
	}
	if env.State(list.Module) >= env.ADMIN_MODULE {
		where["module"]= list.Module
	}
	if list.Action >= server.ADMIN_LOG_ACTION_CREATE {
		where["action"]= list.Action
	}

	if list.Start_time.Unix() > 0 {
		if list.Start_time.Unix() < list.End_time.Unix() {
			where["created_at between ? and ?"] = g.Slice{list.Start_time, list.End_time}
		} else {
			response.Json(req, errcode.ErrCodeTimeError, "")
		}
	}

	result, pages, _ := server.ModelAdminLog.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}
