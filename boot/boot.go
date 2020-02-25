package boot

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
)

func init()  {

	config 	:= g.Config()
	server 	:= g.Server()
	logpath := config.GetString("setting.logpath")
	_ = glog.SetPath(logpath)
	glog.SetStdoutPrint(true)
	server.SetIndexFolder(true)
	server.SetServerRoot("/public")
	server.SetLogPath(logpath)
	server.SetNameToUriType(ghttp.URI_TYPE_ALLLOWER)
	server.SetPort(8199)
}
