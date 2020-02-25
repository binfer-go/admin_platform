package main

import (
	"github.com/gogf/gf/frame/g"
	_ "platform/app/hander/env"
	_ "platform/library/redis"
	_ "platform/boot"
	_ "platform/router"
)
func main()  {
	g.Server().Run()
}
