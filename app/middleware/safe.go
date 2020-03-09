package middleware

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

const (
	SAFE_PAGE_SIZE 		= "page_size"
	SAFE_PAGE_SIZE_MAX 	= 30
)

type safePageReq struct {
	PageSize int `json:"page_size"`
}

func MiddlewareLog(r *ghttp.Request)  {
	g.Log().Println(r.Response.Status, r.URL.Path, r.GetError().Error())
	r.Middleware.Next()
}

func MiddlewarePage(r *ghttp.Request)  {

	if r.Method == "GET" {
		//status, _ := g.Redis().Do("HGET", redis.ADMIN_SITE_CONFIG_INIT, "site_page_max")
		pageSize := r.GetInt(SAFE_PAGE_SIZE)
		if pageSize > SAFE_PAGE_SIZE_MAX || pageSize == 0 {
			r.SetParam(SAFE_PAGE_SIZE, SAFE_PAGE_SIZE_MAX)
		}
	}
	r.Middleware.Next()

}
