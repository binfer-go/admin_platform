package hander

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/hander/role"
	"platform/app/server"
	"platform/library/redis"
	"platform/library/response"
)


type AdminRolePermission struct {}

type putEditAdminRolePermissionReq struct {
	RoleId int32 `json:"role_id"`
	PermissionIds string `json:"permission_ids"`
	Status byte `json:"status"`
	Module string `json:"module"`
}

type optionsAdminRolePermissionReq struct {
	Id int32 `json:"id"`
	ParentId int32 `json:"parent_id"`

}








/**
 * @api {put} /v1/admin_role_permission  绑定权限
 * @apiVersion 0.1.0
 * @apiName  关联
 * @apiGroup 权限列表 AdminPermission
 * @apiParam {Integer} role_id		 	* 角色Id
 * @apiParam {Integer} permission_ids	* 权限Id {  格式:  [{"id": 5},{"id": 6},{"id":18}]       }
 * @apiParam {Integer} status			  状态 { 1：启用 2：禁用, 默认：启用 }
 * @apiParam {String}  module    		  模块权限 {后期扩展}
 * @apiParam {String}  sort    		  	  排序
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
func (task *AdminRolePermission) Put (req *ghttp.Request)  {
	var edit putEditAdminRolePermissionReq

	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if edit.RoleId <= 0 {
		response.Json(req, errcode.ErrCodeAdminRolePermissionRoleId, "")
	}
	if len(edit.PermissionIds) <= 0{
		response.Json(req, errcode.ErrCodeAdminRolePermissionId, "")
	}
	roles, err := server.ModelAdminRolePermission.GetByRoleId(edit.RoleId)
	if err != nil {
		response.Json(req, errcode.ErrCodeAdminRolePermissionRoleId, "")
	}
	var status interface{}
	edit.Module = "{}"
	if roles == nil {

		status, err = server.ModelAdminRolePermission.Create(edit)
	} else {

		status, err = server.ModelAdminRolePermission.Update(edit.RoleId, edit)
	}
	if err != nil {
		response.Json(req, errcode.ErrCodeAdminRolePermissionBindError, "")
	} else {
		_, _ = g.Redis().Do("HDEL", redis.ADMIN_HASH_ROLE_PERMISSION_AUTH, edit.RoleId)
		if ok := role.CashBinRoute.Role_permission(edit.RoleId); ok == true {
			// 开启此处,立即赋予权限生效, 为了安全起见，管理员只能看见相关权限,但是必须重新登陆才会生效 fixme eros
			/*var redisService redis.RedisService
			var casbin role.CasbinRoleCashins
			var permissions []*permission
			_ = redisService.GetJsonDecodeDataByKeyName(redis.ADMIN_HASH_ROLE_PERMISSION_AUTH, edit.RoleId, &permissions)
			casbin.CreateRolePermissionRoute(permissions, edit.RoleId)*/
		}
	}
	log, _ := json.Marshal(&edit)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Level  = server.ADMIN_LOG_LEVEL_WARNING
		options.Action = server.ADMIN_LOG_ACTION_UPDATE
		options.Title  = env.F[env.ADMIN_MODULE_ROLE_MAPS]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}


