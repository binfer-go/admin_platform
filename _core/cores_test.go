package _core

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gconv"
	"platform/_core/collect"
	"platform/library/help"
	"testing"
	"time"
)

func TestCores(t *testing.T) {
	SleepColTime()
}

func TestSleepColTime(t *testing.T) {
	var pull collect.Pull
	userRedis, _ := user_get()
	if userRedis == nil {
		glog.Level(glog.LEVEL_INFO).Println("--- 今日尚未有会员登陆, 拉取信息失败. -------\n")
		return
	}
	var start_time string
	interVal, _ := collect_get()
	if interVal != nil {
		start_time = gconv.Time(interVal).Format(help.TIME_FORMAT_OUT)
	} else {
		start_time = time.Now().Format(help.TIME_FORMAT_OUT)
	}

	ids := g.Slice{}
	_ = json.Unmarshal(gconv.Bytes(userRedis), &ids)
	g.Dump(start_time, pull)
}