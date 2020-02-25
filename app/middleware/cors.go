package middleware

import (
	"fmt"
	"github.com/gogf/gf/net/ghttp"
)

func MiddlewareCORS(r *ghttp.Request)  {
	r.Response.CORSDefault()
	fmt.Println(1)
	r.Middleware.Next()
}
