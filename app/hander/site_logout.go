package hander

import (
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/server"
	"platform/library/help"
	"platform/library/redis"
	"platform/library/response"
	"time"
)

type Logout struct {}


/**
 * @api {post} /v1/login 注销账户
 * @apiVersion 0.1.0
 * @apiName  注销
 * @apiGroup 站点相关 Site
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data	  结果
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
    "code": 200,
    "data": null
    "msg": "成功"
}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*Logout) Post (req *ghttp.Request)  {

	if Admins != nil {
		_, _ = g.Redis().Do("DEL", help.RedisFormat(redis.ADMIN_PLATFORM_TOKEN_LIST, Admins.Id))
		env.MapsManagements.Admins.Remove(Admins.Id)
		Admins = nil
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Action = server.ADMIN_LOG_ACTION_OTHER
			options.Module = env.ADMIN_MODULE_LOGOUT
			options.Title = env.F[env.ADMIN_MODULE_LOGOUT]
			options.Description = fmt.Sprintf("管理员: %s, 在 %s, 第 %d 次登陆后退出系统.", Admins.Account, time.Now(), Admins.LoginCount )
			options.ActionAdminId = Admins.Id
			options.ActionAdminName = Admins.Account
			options.ActionAdminIp = req.GetClientIp()
		})
		response.Json(req, errcode.ErrCodeSuccess, "")
	} else {
		response.Json(req, errcode.ErrCodeFailure, "")
	}

}

