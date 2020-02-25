package middleware

import (
	"github.com/gogf/gf/net/ghttp"
	"net/http"
	"platform/app/errcode"
	"platform/library/response"
)


func MiddlewareErrorHandler(r *ghttp.Request)  {
	r.Middleware.Next()
	if r.Response.Status >= http.StatusInternalServerError {
		r.Response.ClearBuffer()
		response.Json(r, errcode.ErrCodeFailure, "")
	}
}

