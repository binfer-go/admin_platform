package hander

import (
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
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

type Auth struct {
	Token *server.Tokens

}

type postLoginReq struct {

	Account       string    `json:"account"`
	LoginPassword string    `json:"login_password"`

}

type putLoginRefreshReq struct {
	Authorization string `json:"authorization"`
}

type permission struct {
	Id             int32     `json:"id"`
	ParentId       int32     `json:"parent_id"`
	Joins          string    `json:"joins"`
	PermissionName string    `json:"permission_name"`
	PermissionCode string    `json:"permission_code"`
	PermissionPath string 	 `json:"permission_path"`
	RequestParam   string    `json:"request_param"`
	Sort           int32     `json:"sort"`
	Type           byte      `json:"type"`
	Status         byte      `json:"status"`
}




/**
 * @api {post} /v1/login *** 登陆
 * @apiVersion 0.1.0
 * @apiName  登陆
 * @apiGroup 站点相关 Site
 * @apiParam {String}  account			* 账户	{ > 5个字符 }		 @default：admin
 * @apiParam {String}  login_password	* 登陆密码 { 6 - 40个字符 }		 @default：admin
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   Authorization：Bearer token  [请求格式: Authorization = (固定前缀)Bearer(空格) (登陆返回：data字符串)token] *(默认有效期：1小时)
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
 {
	"api": 1583482081,	# 配置缓存版本校验
	"time": 1583482137,	# 服务器当前时间戳
	"code": 200,
	"data": {
		"base": {
		"id": 48,
		"role_id": 1,
		"role_name": "技术部",
		"account": "test001",
		"nick_name": "allen",
	},
	"permission": null,
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6ImV2ZXJ5b25lIiwiRXhwaXJlc0F0IjoxNTgzNDg1NzM3LCJJZCI6NDgsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6InBsYXRmb3JtLmFkbWluIiwiTm90QmVmb3JlIjowLCJTdWJqZWN0IjoicGxhdGZvcm0ifQ.gmbCw-lxA2IdfvIuVSU1ZIm89WiJ9yZMFQq4baJYVo0"
	},
	"msg": "成功",

 }
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (auth *Auth) Post (req *ghttp.Request)  {
	var login postLoginReq

	if err := req.Parse(&login); err != nil {
		response.Json(req, errcode.ErrCodeLoginError, "")
	}
	if len(login.Account) < 5 || len(login.LoginPassword) < 5{
		response.Json(req, errcode.ErrCodeLoginError, "")
	}
	info, err := server.ModelAdmin.GetByAccount(login.Account)
	if err != nil || info == nil {
		response.Json(req, errcode.ErrCodeLoginError, "")
		return
	}
	var modelAdmin model.Admin
	_ = info.Struct(&modelAdmin)
	// 密码错误
	if modelAdmin.LoginPassword != login.LoginPassword {
		response.Json(req, errcode.ErrCodeLoginError, "")
	}
	// 过滤未绑定权限的角色账户
	if modelAdmin.RoleId != server.ADMIN_MASTER_ROLE_DEFAULT{
		permissions, err := server.ModelAdminRolePermission.GetByRoleId(modelAdmin.RoleId)
		if err != nil || permissions == nil {
			response.Json(req, errcode.ErrCodeAdminBindPermissionError, "")
		}
	}
	var modelRole model.AdminRole
	roles, _ := server.ModelAdminRole.GetById(modelAdmin.RoleId)
	_ = roles.Struct(&modelRole)
	if modelRole.Status != server.ADMIN_ROLE_STATUS_ENABLE {
		response.Json(req, errcode.ErrCodeLoginStatusError, "")
	}
	// 禁用
	if modelAdmin.Status != server.ADMIN_STATUS_ENABLE {
		response.Json(req, errcode.ErrCodeLoginStatusError, "")
		return
	}
	token, err := auth.Token.Sign(server.NewOptions(func(options *server.Options) {
		options.Id = modelAdmin.Id
		options.Ip = req.GetClientIp()
	}))
	modelAdmin.LastLoginTime = time.Now()
	modelAdmin.LastLoginIp = req.GetClientIp()
	modelAdmin.LoginCount = modelAdmin.LoginCount+1
	_, _ = server.ModelAdmin.Update(modelAdmin.Id, modelAdmin)
	_, err = g.Redis().Do("SETEX", help.RedisFormat(redis.ADMIN_PLATFORM_TOKEN_LIST, modelAdmin.Id), server.TOKEN_EFFECTIVE_TIME, token)
	if err != nil {

		response.Json(req, errcode.ErrCodeLoginError, "")
	}
	env.MapsManagements.Admins.Set(modelAdmin.Id, &modelAdmin)
	glog.Debugf("=== @login -------- count: {%d}, current: {%s}", env.MapsManagements.Admins.Size(), modelAdmin.Account)

	var redisService redis.RedisService
	var permissions []*permission
	var casbin role.CasbinRoleCashins
	role.CashBinRoute.Role_permission(modelAdmin.RoleId)
	_ = redisService.GetJsonDecodeDataByKeyName(redis.ADMIN_HASH_ROLE_PERMISSION_AUTH, modelAdmin.RoleId, &permissions)
	casbin.CreateRolePermissionRoute(permissions, modelAdmin.RoleId)
	data := g.Map{
		"permission" : permissions,
		"token" : token,
		"base": modelAdmin,
	}
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Action = server.ADMIN_LOG_ACTION_OTHER
		options.Module = env.ADMIN_MODULE_LOGIN
		options.Title = env.F[env.ADMIN_MODULE_LOGIN]
		options.Description = fmt.Sprintf("管理员: %s, 在 %s, 第 %d 次登陆", modelAdmin.Account, time.Now(), modelAdmin.LoginCount )
		options.ActionAdminId = modelAdmin.Id
		options.ActionAdminName = modelAdmin.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess, "", data)

}


/**
 * @api {put} /v1/refresh ###  刷新TOKEN
 * @apiVersion 0.1.0
 * @apiName  刷新TOKEN
 * @apiGroup 站点相关 Site
 * @apiParam   {String}    authorization   * token
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": {
			"service_time": 1582864529, #服务器当前时间戳
			"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6ImV2ZXJ5b25lIiwiRXhwaXJlc0F0IjoxNTgyNzE1Nzg2LCJJZCI6NDgsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6InBsYXRmb3JtLmFkbWluIiwiTm90QmVmb3JlIjowLCJTdWJqZWN0IjoicGxhdGZvcm0ifQ.JQj0QHC4iN-22XyfKucdeAGWb1-sTPsydjgxdACTmXU"
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
func (auth *Auth) Put (req *ghttp.Request)  {

	token, err := auth.Token.Sign(server.NewOptions(func(options *server.Options) {
		options.Id = Admins.Id
		options.Ip = req.GetClientIp()
	}))
	_, err = g.Redis().Do("SETEX", help.RedisFormat(redis.ADMIN_PLATFORM_TOKEN_LIST, Admins.Id), server.TOKEN_EFFECTIVE_TIME, token)
	if err != nil {
		response.Json(req, errcode.ErrCodeInvalidToken, "")
	}
	data := g.Map{
		"service_time"  : time.Now().Unix(),
		"token" : token,
	}
	response.Json(req, errcode.ErrCodeSuccess, "", data)

}

