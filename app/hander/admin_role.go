package hander

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/hander/role"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
	"platform/library/redis"
	"platform/library/response"
	"time"
)


type AdminRole struct {}

type putEditAdminRoleReq struct {
	Id int32 `json:"id"`
	Status byte `json:"status"`
	RoleName string `json:"role_name"`
	Remark string `json:"remark"`
	UpdatedAt time.Time `json:"updated_at"`
}

type getListAdminRoleReq struct {
	Id int32 `json:"id"`
	RoleName string `json:"role_name"`
	Status byte `json:"status"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

type patchAdminRolePermission struct {
	RoleId int32 `json:"id"`
}


/**
 * @api {get} /v1/admin_role  管理角色列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 管理角色 AdminRole
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			Id查询详情
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {String}  role_name    角色名称
 * @apiParam {Integer} status		状态 {1：启用 2：禁用} {config: admin_role_status}
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
		RoleName  string    `plat:"role_name" json:"role_name"`   // 角色名称
		RoleCode  string    `plat:"role_code" json:"role_code"`   // 角色代号
		Status    byte      `plat:"status" json:"status"`         // 1:启用 2：禁用
		Remark    string    `plat:"remark" json:"remark"`         // 备注
		CreatedAt time.Time `plat:"created_at" json:"created_at"` // 创建时间
		UpdatedAt time.Time `plat:"updated_at" json:"updated_at"` // 更新时间
		CreatedIp string    `plat:"created_ip" json:"created_ip"` // 创建Ip
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
func (*AdminRole)Get(req *ghttp.Request)  {
	var list getListAdminRoleReq

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
	if list.RoleName != "" {
		where["role_name"]= list.RoleName
	}
	if list.Id > 0 {
		where["id"] = list.Id
	}
	if Admins.RoleId != server.ADMIN_MASTER_ROLE_DEFAULT {
		where["id!="] = server.ADMIN_MASTER_ROLE_DEFAULT
	}
	result, pages, _ := server.ModelAdminRole.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {post} /v1/admin_role  添加管理角色
 * @apiVersion 0.1.0
 * @apiName  添加
 * @apiGroup 管理角色 AdminRole
 * @apiParam {String}  role_name		* 角色名称 	{ 4 - 40个字符 }
 * @apiParam {Integer} status			* 状态 	{ 1：启用 2：禁用 }
 * @apiParam {String}  remark			  备注
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
func (*AdminRole) Post (req *ghttp.Request)  {
	var add model.AdminRole

	if err := req.Parse(&add); err != nil {
		response.Json(req, errcode.ErrCodeAdminRoleAddError, "")
	}
	if len(add.RoleName) < 2 || len(add.RoleName) > 40 {

		response.Json(req, errcode.ErrCodeAdminRoleError, "")
	}

	info, err := server.ModelAdminRole.GetByRoleName(add.RoleName)
	if err != nil || info != nil{
		response.Json(req, errcode.ErrCodeAdminRoleIsAlready, "")
	}

	add.CreatedIp = req.GetClientIp()
	add.CreatedAt = time.Now()
	add.UpdatedAt = time.Now()
	add.Status = server.ADMIN_ROLE_STATUS_ENABLE
	data := help.Filter(add)
	if data == nil {

		response.Json(req, errcode.ErrCodeAdminRoleAddError, "")
	}
	result, err := server.ModelAdminRole.Create(add)
	if err != nil {

		response.Json(req, errcode.ErrCodeAdminRoleAddError, "")
	}
	log, _ := json.Marshal(&add)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Action = server.ADMIN_LOG_ACTION_CREATE
		options.Title = env.F[env.ADMIN_MODULE_ROLE]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess, "", result)

}




/**
 * @api {put} /v1/admin_role  更新管理角色
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 管理角色 AdminRole
 * @apiParam {Integer} ID		 	   * ID
 * @apiParam {String}  role_name	   * 角色名称
 * @apiParam {Integer} status		   * 状态 	{ 1：启用 2：禁用 }
 * @apiParam {String}  remark			 备注
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
func (task *AdminRole) Put (req *ghttp.Request)  {
	var edit putEditAdminRoleReq

	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if edit.Id == 0 {
		response.Json(req, errcode.ErrCodeAdminRoleEditError, "")
	}
	info, err := server.ModelAdminRole.GetById(edit.Id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeAdminRoleEditError, "")
		return
	}
	if len(edit.RoleName) < 2 {
		response.Json(req, errcode.ErrCodeAdminRoleError, "")
	}
	type temps struct {
		RoleName string `json:"role_name"`
	}
	var temp temps
	_ = info.Struct(&temp)
	if edit.RoleName != temp.RoleName {
		_, err := server.ModelAdmin.UpdateRoleName(edit.Id, g.Map{"role_name":edit.RoleName})
		if err != nil {
			return
		}
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	status, err := server.ModelAdminRole.Update(edit.Id, data)
	if err != nil {

		response.Json(req, errcode.ErrCodeAdminRoleEditError, "")
	}
	log, _ := json.Marshal(&edit)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Action = server.ADMIN_LOG_ACTION_UPDATE
		options.Title = env.F[env.ADMIN_MODULE_ROLE]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}

/**
 * @api {get} /v1/admin_role_options  管理角色选项
 * @apiVersion 0.1.0
 * @apiName  选项
 * @apiGroup 管理角色 AdminRole
 * @apiParam {Integer} id		 	   * ID
 * @apiParam {String}  role_name	   * 角色名称
 * @apiParam {Integer} status		   * 状态 	{ 1：启用 2：禁用 }
 * @apiParam {String}  remark			 备注
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
func (*AdminRole) Option (req *ghttp.Request)  {
	where := g.Map{}
	if Admins.RoleId != server.ADMIN_MASTER_ROLE_DEFAULT {
		where["id!="] = server.ADMIN_MASTER_ROLE_DEFAULT
	}
	roles, err := server.ModelAdminRole.Options(where)
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	response.Json(req, errcode.ErrCodeSuccess, "", roles)

}



/**
 * @api {get} /v1/admin_role_maps  角色权限列表maps
 * @apiVersion 0.1.0
 * @apiName  maps
 * @apiGroup 管理角色 AdminRole
 * @apiParam {Integer} id		 	   * 角色ID
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
func (*AdminRole) RoleMaps (req *ghttp.Request)  {

	var patch patchAdminRolePermission
	if err := req.Parse(&patch); err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if patch.RoleId <= 0 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	var redisService redis.RedisService

	var permissions []*permission
	role.CashBinRoute.Role_permission(Admins.RoleId)
	_ = redisService.GetJsonDecodeDataByKeyName(redis.ADMIN_HASH_ROLE_PERMISSION_AUTH, patch.RoleId, &permissions)

	response.Json(req, errcode.ErrCodeSuccess, "", permissions)

}