package hander

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"platform/app/errcode"
	"platform/app/hander/env"
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


/**
 * @api {post} /v1/login 登陆
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
    "code": 200,
    "data": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6IiIsIkV4cGlyZXNBdCI6MTU4MjM1MTQ4MSwiSWQiOjEsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6IiIsIk5vdEJlZm9yZSI6MCwiU3ViamVjdCI6IiJ9.n4uqM02P_fZeoztmK4HnC9zOr-a_tV1pFa86fwscMZQ",
    "msg": "成功"
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
	// 禁用
	if modelAdmin.Status != server.ADMIN_STATUS_ENABLE {

		response.Json(req, errcode.ErrCodeLoginStatusError, "")
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

	response.Json(req, errcode.ErrCodeSuccess, "", token)

}

