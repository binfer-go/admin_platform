package redis

import (
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

const (


	ADMIN_SITE_CONFIG_INIT    		= "site:config"
	ADMIN_HASH_ROLE_PERMISSION_AUTH = "admin:role_permission"
	ADMIN_PLATFORM_TOKEN_LIST 		= "admin:token:"
	// 会员token
	USER_TOKEN_STATUS 				= "user_token_"

	ADMIN_REPORT_COLLECT_TIME_DAY	= "report:users:"			// 报表拉取用户
	ADMIN_REPORT_FLAG_TIME			= "report:collect_flag"		// 报表数据拉取时间标记
	ADMIN_LOCK_TIME					= int(10)
)

var (
	ModelRedis *RedisService
)

func init()  {
	ModelRedis = &RedisService{}
}

type RedisService struct {}

func (*RedisService) GetJsonDecodeDataByKeyName(key string, val interface{}, result interface{}) error {

	info, err := g.Redis().Do("HGET", key, val)
	if err != nil {
		return err
	}
	if info != nil {
		err = gjson.DecodeTo(info, result)
		if err != nil {
			return err
		}
	}
	return nil
}

func (*RedisService) Format (data []map[string]interface{}) g.Slice {

	var slice g.Slice
	for _,v := range data {
		for _, val := range v {
			slice = append(slice, val)
		}
	}
	return slice
}

func (*RedisService) Lock (key string, ts int, val interface{}) int {

	flag := 0
	if ts == flag {
		ts = ADMIN_LOCK_TIME
	}
	if val != nil {
		_, _ = g.Redis().Do("SETEX", key, ts, val)
		return ts
	}
	ttl, _ := g.Redis().Do("TTL", key)
	if gconv.Int(ttl) <= flag {
		return flag
	}
	return gconv.Int(ttl)

}

