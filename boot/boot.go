package boot

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"platform/app/hander/env/rpc"
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
	err := rpc.RegisterClient(g.Config().GetString("rpc.default"))
	if err != nil {
		glog.Level(glog.LEVEL_ERRO).Printf("grpc", err.Error())
	}
	server.SetPort(8199)
}
