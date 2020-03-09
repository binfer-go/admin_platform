package _core

import (
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/os/gtimer"
	"platform/_core/collect"
	"time"
)


func SleepColTime()  {

	interval := time.Second
	var pull collect.Pull
	i := 1
	gtimer.AddSingleton(interval, func() {
		glog.Printf("\n------------------ {%v} => \n", i)
		pull.PullUser()
		pull.PullBills()
		i++
		time.Sleep(30*time.Second)
	})
	select {}

}



