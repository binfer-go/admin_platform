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
	"platform/library/redis"
	"platform/library/response"
	"time"
)
var Admins *model.Admin

type Admin struct {}

type putEditAdminReq struct {
	Id int32 `json:"id"`
	NickName string `json:"role_name"`
	RoleId int32 `json:"role_id"`
	RoleName string `json:"role_name"`
	LoginPassword string `json:"login_password"`
	Status byte `json:"status"`
	UpdatedAt time.Time `json:"updated_at"`
}

type getListAdminReq struct {
	Id int32 `json:"id"`
	Status byte `json:"status"`			// 1：启用 2：禁用
	Account string `json:"account"`
	RoleId int32 `json:"role_id"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

/**
 * @api {get} /v1/admin  管理员列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 管理账户 Admin
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			单条信息详情
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {String}  account		管理员账户
 * @apiParam {String}  role_id		角色ID
 * @apiParam {Integer} status		状态 {1：显示 2：隐藏}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id            int32     `plat:"primary_key;id" json:"id"`
		RoleId        int32     `plat:"role_id" json:"role_id"`                 // 角色ID
		RoleName      string    `plat:"role_name" json:"role_name"`             // 角色名
		Account       string    `plat:"account" json:"account"`                 // 账户
		NickName      string    `plat:"nick_name" json:"nick_name"`             // 昵称
		LoginPassword string    `plat:"login_password" json:"login_password"`   // 登陆密码
		SecretKey     string    `plat:"secret_key" json:"secret_key"`           // 安全秘钥
		Status        byte      `plat:"status" json:"status"`                   // 状态：1:启用 2：停用
		CreatedAt     time.Time `plat:"created_at" json:"created_at"`           // 创建时间
		UpdatedAt     time.Time `plat:"updated_at" json:"updated_at"`           // 更新时间
		CreatedId     int32     `plat:"created_id" json:"created_id"`           // 创建管理ID
		CreatedIp     string    `plat:"created_ip" json:"created_ip"`           // 创建Ip
		LastLoginIp   string    `plat:"last_login_ip" json:"last_login_ip"`     // 最后登陆ip
		LoginCount    int32     `plat:"login_count" json:"login_count"`         // 登陆次数
		LastLoginTime time.Time `plat:"last_login_time" json:"last_login_time"` // 最后登陆时间
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
func (*Admin)Get(req *ghttp.Request)  {
	var list getListAdminReq

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
	if list.Account != "" {
		where["account"]= list.Account
	}
	if list.RoleId > 0 {
		where["role_id"]= list.RoleId
	}
	if list.Id > 0 {
		where["id"]= list.Id
	}

	result, pages, _ := server.ModelAdmin.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {post} /v1/admin  创建管理员账户
 * @apiVersion 0.1.0
 * @apiName  添加
 * @apiGroup 管理账户 Admin
 * @apiParam {Integer} role_id 		    * 角色id
 * @apiParam {String}  role_name 		* 角色名
 * @apiParam {String}  account			* 账户 	{ 5 - 40个字符 }
 * @apiParam {String}  login_password	* 登陆密码 { 6 - 40个字符 }
 * @apiParam {Integer} status			* 状态 	{ 1：启用 2：禁用 } {config: admin_status}
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
func (*Admin) Post (req *ghttp.Request)  {
	var add model.Admin

	if err := req.Parse(&add); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if len(add.Account) < 6 || len(add.Account) > 40 {
		response.Json(req, errcode.ErrCodeAdminAccountLimitError, "")
	}
	if len(add.LoginPassword) < 6 || len(add.LoginPassword) > 40 {
		response.Json(req, errcode.ErrCodeAdminPasswordLimitError, "")
	}
	if add.RoleId <= 0 {
		response.Json(req, errcode.ErrCodeCreateAdminError, "")
	}
	info, err := server.ModelAdmin.GetByAccount(add.Account)
	if err != nil || info != nil{
		response.Json(req, errcode.ErrCodeAdminAlreadyExist, "")
	}
	roles, err := server.ModelAdminRole.GetById(add.RoleId)
	if err != nil || roles == nil {
		response.Json(req, errcode.ErrCodeAdminRoleNotError, "")
		return
	} else {
		if Admins.RoleId != server.ADMIN_MASTER_ROLE_DEFAULT && add.RoleId != server.ADMIN_MASTER_ROLE_DEFAULT  {
			permissions, err := server.ModelAdminRolePermission.GetByRoleId(add.RoleId)
			if err != nil || permissions == nil {
				response.Json(req, errcode.ErrCodeAdminBindPermissionError, "")
			}
		} else {
			// response.Json(req, errcode.ErrCodeAdminMasterBindError, "")
		}
	}
	add.NickName  = add.NickName
	add.RoleId 	  = add.RoleId
	add.RoleName  = add.RoleName
	add.SecretKey = add.SecretKey
	add.UpdatedAt = time.Now()
	add.CreatedAt = time.Now()
	add.LastLoginTime = time.Now()
	add.LastLoginIp = req.GetClientIp()
	add.CreatedIp = req.GetClientIp()
	add.LoginCount = 0
	add.CreatedId = Admins.Id
	data := help.Filter(add)
	if data == nil {
		response.Json(req, errcode.ErrCodeCreateAdminError, "")
	}
	createResult, err := server.ModelAdmin.Create(add)
	if err != nil || createResult == nil {
		response.Json(req, errcode.ErrCodeCreateAdminError, "")
	}

	log, _ := json.Marshal(&add)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Level  = server.ADMIN_LOG_LEVEL_WARNING
		options.Action = server.ADMIN_LOG_ACTION_CREATE
		options.Title = env.F[env.ADMIN_MODULE]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess, "", createResult)

}




/**
 * @api {put} /v1/admin  更新管理员账户
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 管理账户 Admin
 * @apiParam {Integer} id		 	   * ID
 * @apiParam {Integer} role_id 		   * 角色id
 * @apiParam {String}  role_name 	   * 角色名
 * @apiParam {String}  nick_name		 昵称
 * @apiParam {String}  login_password	 登陆密码 { 6 - 40个字符 }
 * @apiParam {Integer} status			 状态 	{ 1：显示 2：隐藏 }
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
func (*Admin) Put (req *ghttp.Request)  {
	var edit putEditAdminReq

	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if edit.Id == 0 {
		response.Json(req, errcode.ErrCodeUpdateAdminError, "")
	}
	info, err := server.ModelAdmin.GetById(edit.Id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeAdminNotExist, "")
	}
	role_status := server.ModelAdminRole.CheckAdminRole(edit.RoleId)
	if role_status == false {
		response.Json(req, errcode.ErrCodeUpdateAdminError, "")
	}
	if Admins.RoleId != server.ADMIN_MASTER_ROLE_DEFAULT && edit.RoleId != server.ADMIN_MASTER_ROLE_DEFAULT  {
		permissions, err := server.ModelAdminRolePermission.GetByRoleId(edit.RoleId)
		if err != nil || permissions == nil {
			response.Json(req, errcode.ErrCodeAdminBindPermissionError, "")
		}
	} else {
		// response.Json(req, errcode.ErrCodeAdminMasterBindError, "")
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	status, err := server.ModelAdmin.Update(edit.Id, data)
	if err != nil || status != nil {
		if edit.Status != server.ADMIN_STATUS_ENABLE {
			_, _ = g.Redis().Do("DEL", help.RedisFormat(redis.ADMIN_PLATFORM_TOKEN_LIST, edit.Id))
		}
		log, _ := json.Marshal(&edit)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Level  = server.ADMIN_LOG_LEVEL_WARNING
			options.Action = server.ADMIN_LOG_ACTION_UPDATE
			options.Title = env.F[env.ADMIN_MODULE]
			options.Description = string(log)
			options.ActionAdminId = Admins.Id
			options.ActionAdminName = Admins.Account
			options.ActionAdminIp = req.GetClientIp()
		})
	}

	response.Json(req, errcode.ErrCodeSuccess, "", status)

}

/**
 * @api {patch} /v1/admin  我的权限
 * @apiVersion 0.1.0
 * @apiName  选项
 * @apiGroup 管理账户 Admin
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
func (*Admin) Patch (req *ghttp.Request)  {

	if Admins == nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	var permissions []*permission
	if Admins.RoleId > server.ADMIN_MASTER_ROLE_DEFAULT {
		var redisService redis.RedisService
		_ = redisService.GetJsonDecodeDataByKeyName(redis.ADMIN_HASH_ROLE_PERMISSION_AUTH, Admins.RoleId, &permissions)
	}
	response.Json(req, errcode.ErrCodeSuccess, "", permissions)
}

