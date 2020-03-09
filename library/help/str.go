package help

import (
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
	"strings"
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


/**
	table : 表名
	columns : 更新的字段，in条件名称代入其中
	data: 更新的数据， in条件名称代入其中
	key： in条件名称
	other： + | - | * | /  更新数据类型增加 扣除，
 */
func Sql(table string, columns g.Array, data g.List, key string, other string) string {

	if key == "" {
		key = "id"
	}
	ids := []string{}
	var sql = fmt.Sprintf("UPDATE %s SET  ", table)
	for _, column := range columns {
		var others string
		if len(other) > 0 {
			if column.(interface{}) != key {
				others = gconv.String(column.(interface{})) + other
			}
		} else {
			others = ""
		}
		sql = sql + fmt.Sprintf("`%s` = %v CASE `%s` ", column.(interface{}), others, key);

		for _, val := range data {
			if len(ids) != len(data) {
				ids = append(ids, gconv.String(val[key]))
			}
			sql = sql + fmt.Sprintf("WHEN '%v' THEN '%v' ", val[key], val[column.(string)])
		}
		sql = sql + " END,"
	}
	return strings.Trim(sql, ",") + fmt.Sprintf(" where %s in (%s)", key, strings.Join(ids, ","))
}
