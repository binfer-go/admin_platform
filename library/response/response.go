package response

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gpage"
	"os"
	"platform/app/errcode"
	"runtime"
	"strings"
	"time"
)


type responses struct {
	code int32
	msg  string
	data interface{}
	page interface{}
}

func Json(r *ghttp.Request, code errcode.ErrCode, msg string, data ...interface{})  {
	message := ""
	responseData := interface{}(nil)
	if len(msg) > 0 {
		message = msg
	} else {
		message = code.String()
	}
	result := g.Map{
		"code": int32(code),
		"msg": message,
		"data": responseData,
		"time": time.Now().Unix(),
		"api": 1583482081,
	}
	if len(data) > 0 {
		result["data"] = data[0]
		if len(data) == 2 {
			result["page"] = data[1]
		}
	}
	_ = r.Response.WriteJson(result)
	r.Exit()

}




type Hpage struct {

	TotalPage 	int
	TotalSize 	int
	CurrentPage int
	PageBarNum 	int

}

func Page(page *gpage.Page) *Hpage {

	return &Hpage{
		TotalPage:   page.TotalPage,
		TotalSize:   page.TotalSize,
		CurrentPage: page.CurrentPage,
		PageBarNum:  page.PageBarNum,
	}

}



func CheckError(err error) {
	if err != nil {
		LogError(err, 2)
		os.Exit(1)
	}
}


func LogError(err error, skip int) {
	pc, file, line, _ := runtime.Caller(skip)
	ps := string(os.PathSeparator)
	arr := strings.Split(file, ps)
	var fname string
	if len(arr) > 2 {
		start := len(arr) - 2
		fname = strings.Join(arr[start:], ps)
	} else {
		fname = file
	}
	glog.Errorf("Error: %s [%s:%d: %s]", err.Error(), fname, line, runtime.FuncForPC(pc).Name())
}
