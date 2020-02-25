package middleware

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

func MiddlewareLog(r *ghttp.Request)  {
	g.Log().Println(r.Response.Status, r.URL.Path, r.GetError().Error())
	r.Middleware.Next()
}

func MiddlewarePage(r *ghttp.Request)  {

	if r.Method == "GET" {
		//status, _ := g.Redis().Do("HGET", redis.ADMIN_SITE_CONFIG_INIT, "site_page_max")
		pageSize := r.GetInt("page_size")
		if pageSize > 30 || pageSize == 0 {
			r.SetParam("page_size", 30)
		}
	}
	r.Middleware.Next()
}
