package collect

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"platform/app/server/report"
	"platform/library/redis"
)

func CollectUserReport()  {

	list, _ := report.ModelReportUser.Get("", "user_id", "", "")
	ls := list.List()
	// set_user_ids(list.List())
	g.Dump(ls)
}

func set_user_ids(val interface{})  {

	jsonVal, _ := json.Marshal(val)
	_, _ = g.Redis().Do("SET", redis.ADMIN_REPORT_USER_Ids, jsonVal)
}

func get_user_ids() interface{} {

	result, _ := g.Redis().Do("GET", redis.ADMIN_REPORT_USER_Ids)
	return  result

}

func set_count(i int)  {
	_,_ = g.Redis().Do("SET", redis.ADMIN_REPORT_USER_NUM_FLAG, string(i))
}

func get_count() string  {
	i, err := g.Redis().Do("GET", redis.ADMIN_REPORT_USER_NUM_FLAG)

	if err != nil {
		return "0"
	} else {
		return i.(string)
	}
}