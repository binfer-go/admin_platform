package middleware

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"platform/app/errcode"
	"platform/app/hander"
	"platform/app/hander/env"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
	"platform/library/redis"
	"platform/library/response"
	"strings"
)

func MiddlewareAuth(r *ghttp.Request)  {

	authorization := r.Header.Get("Authorization")
	if ! strings.Contains(authorization, " ") {
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
		if tempAdmin := env.MapsManagements.Admins.Get(mod.Id); tempAdmin != nil {
			hander.Admins = tempAdmin.(*model.Admin)
		} else {
			response.Json(r, errcode.ErrCodeInvalidToken, "")
		}

		r.Middleware.Next()
	}

}