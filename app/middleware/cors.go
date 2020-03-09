package middleware

import (
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/library/response"
)

func MiddlewareCORS(r *ghttp.Request)  {

	r.Response.CORSDefault()
	if r.Method == "OPTIONS" {
		response.Json(r, errcode.ErrCodeSuccess, "")
		return
	}
	r.Middleware.Next()

}
