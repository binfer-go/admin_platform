package middleware

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gconv"
	"platform/app/errcode"
	"platform/app/hander"
	"platform/app/hander/env"
	"platform/app/hander/role"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
	"platform/library/redis"
	"platform/library/response"
	"strings"
)



func MiddlewareAuth(r *ghttp.Request)  {

	authorization := r.Header.Get("authorization")
	if len(authorization) <= 0 {
		response.Json(r, errcode.ErrCodeInvalidToken, "")
	}
	str := strings.Split(authorization, " ")
	if len(str) < 1 {
		response.Json(r, errcode.ErrCodeInvalidToken, "")
	}
	var tokens server.Tokens
	mod, err := tokens.Check(str[1])
	if err != nil {
		response.Json(r, errcode.ErrCodeInvalidToken, "")
	}
	token, err := g.Redis().Do("GET", help.RedisFormat(redis.ADMIN_PLATFORM_TOKEN_LIST, mod.Id))
	if gconv.String(token) != gconv.String(str[1]){
		response.Json(r, errcode.ErrCodeInvalidToken, "")
	} else {
		// 重置token失效时间
		_, _ = g.Redis().Do("EXPIRE", help.RedisFormat(redis.ADMIN_PLATFORM_TOKEN_LIST, mod.Id), server.TOKEN_EFFECTIVE_TIME)
		if tempAdmin := env.MapsManagements.Admins.Get(mod.Id); tempAdmin != nil {

			hander.Admins = tempAdmin.(*model.Admin)
			server.Token  = &token
			if hander.Admins.RoleId != server.ADMIN_MASTER_ROLE_DEFAULT {
				// 是否需要重新生成权限缓存
				role.CashBinRoute.Role_permission(hander.Admins.RoleId)
				// 校验api
				status := permission(r)
				if status == false {
					response.Json(r, errcode.ErrCodeApiRouteAuthError, "Error: Router : "+ r.Router.Uri + "; Method: " + r.Method)
				}
			}
		} else {
			response.Json(r, errcode.ErrCodeInvalidToken, "")
		}

		r.Middleware.Next()

	}

}

func permission(r *ghttp.Request) bool {

	if route := strings.Split(r.Router.Uri, "/"); route != nil {
		 ls := g.Map{
		 	"admin" : "PATCH",
		 }
		 // 过滤不校验的api
		 for k, v := range ls {
			 if route[len(route)-1] == k && strings.ToUpper(r.Method)==v{
			 	return true
			 }
		 }
		status, err := role.Casbins.Enforce(gconv.String(hander.Admins.RoleId), route[len(route)-1], r.Method)
		glog.Debug(role.Casbins.GetPolicy(), status)
		if err == nil && status == true {
			return true
		}
	}
	return false
}

