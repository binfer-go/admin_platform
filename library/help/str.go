package help

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
)

func Filter(data interface{}) g.Map {

	where := gconv.Map(data)
	for k, v := range where {
		switch v.(type) {
		case string:
			if v == "" {
				delete(where, k)
			}
		case byte:
			if v == byte(0) {
				delete(where, k)
			}
		}
	}
	return where
}

func RedisFormat(key string, other interface{}) string {

	return key+gconv.String(other)

}