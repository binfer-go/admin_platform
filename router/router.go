package router

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/hander"
	"platform/app/middleware"
)

func init()  {

	server	:= g.Server()
	server.BindMiddlewareDefault()
	server.Group("/v1", func(group *ghttp.RouterGroup) {

		group.REST("/config", 	new(hander.Configs))
		group.REST("/login", 	new(hander.Auth))
		//group.Middleware(middleware.MiddlewareAuth, middleware.MiddlewarePage)
		group.Middleware(middleware.MiddlewarePage)
		group.REST("/admin", 		new(hander.Admin))
		group.REST("/admin_role", 	new(hander.AdminRole))
		group.REST("/user", 		new(hander.User))
		group.REST("/task", 		new(hander.Task))
		group.REST("/task_publish", 	new(hander.TaskPublish))
		group.REST("/task_subscribe", 	new(hander.TaskSubscribe))
	})

}




