package redis

import (
	"github.com/gogf/gf/frame/g"
	"testing"
)

func TestRedisService_Format(t *testing.T) {
	f := ModelRedis.Lock("test:1", 10, nil)
	g.Dump(f)
}
