package _core

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/os/gtimer"
	"github.com/gogf/gf/util/gconv"
	"platform/_core/collect"
	"platform/library/help"
	"platform/library/redis"
	"time"
)


func SleepColTime()  {

	interval := time.Second
	var pull collect.Pull
	i := 1
	gtimer.AddSingleton(interval, func() {
		glog.Printf("\n------------------ {%v} => \n", i)
		pull.PullUser()
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
		_, _ = collect_set(time.Now().Format(help.TIME_FORMAT_OUT)) // 存储本次查询时间标记

		ids := g.Slice{}
		_ = json.Unmarshal(gconv.Bytes(userRedis), &ids)
		pull.PullBills(start_time, ids)
		pull.PullTaskPublish(start_time, ids)
		pull.PullTaskSubscribe(start_time, ids)
		i++
		time.Sleep(30*time.Second)
	})
	select {}

}


func collect_get() (interface{}, error) {
	return g.Redis().Do("GET", redis.ADMIN_REPORT_FLAG_TIME)
}

func collect_set(value interface{}) (interface{}, error) {
	return g.Redis().Do("SET", redis.ADMIN_REPORT_FLAG_TIME, value)
}

func user_get() (interface{}, error) {
	return g.Redis().Do("GET", redis.ADMIN_REPORT_COLLECT_TIME_DAY+help.TimeStrips(0,0,0).Format(help.TIME_FORMAT_DAY_OUT))
}