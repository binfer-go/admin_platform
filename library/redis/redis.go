package redis

import (
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

const (
	ADMIN_SITE_CONFIG    			= "site:config"				// 站点配置

	ADMIN_HASH_SITE_CONFIG_BUSINESS = "site:config:business"	// 业务配置

	ADMIN_HASH_ROLE_PERMISSION_AUTH = "admin:role_permission"	// 管理员角色权限

	ADMIN_PLATFORM_TOKEN_LIST 		= "admin:token:"			// 管理员token

	ADMIN_REPORT_COLLECT_TIME_DAY	= "report:users:"			// 报表拉取用户
	ADMIN_REPORT_FLAG_TIME			= "report:collect_flag"		// 报表数据拉取时间标记
	ADMIN_REPORT_USER_NUM_FLAG		= "report:users:count"		// 会员报表人数
	ADMIN_REPORT_USER_Ids			= "report:users:list"		// 会员ids

	ADMIN_LOCK_TIME_DEPOSIT			= "site:lock:deposit:"			// 锁定存款单
	ADMIN_LOCK_TIME_MANUAL_DEPOSIT	= "site:lock:manual_deposit:"	// 锁定人工存款单
	ADMIN_LOCK_TIME_WITHDRAW		= "site:lock:withdraw:"			// 锁定取款单
	ADMIN_LOCK_TIME_MANUAL_WITHDRAW	= "site:lock:manual_withdraw:"	// 锁定人工取款单
	ADMIN_LOCK_TIME_TASK_PUBLISH	= "site:lock:publish:"			// 锁定发布单
	ADMIN_LOCK_TIME_TASK_SUBSCRIBE	= "site:lock:subscribe:"		// 锁定接单
	ADMIN_LOCK_TIME					= 5								// 锁定时间

	USER_TOKEN_STATUS 				= "user_token_"				// 会员token
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

