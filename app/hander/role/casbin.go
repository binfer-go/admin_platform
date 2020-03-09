package role

import (
	"encoding/json"
	"github.com/casbin/casbin/v2"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
	"platform/app/server"
	"platform/library/redis"
)

type Example struct {

}

var Casbins *casbin.Enforcer
var CashBinRoute *CasbinRoleCashins

func init()  {


	CashBinRoute = &CasbinRoleCashins{}
	path := g.Config().GetString("setting.roles")
	//_ = g.Config().SetPath(path)
	Casbins, _ 	 = casbin.NewEnforcer(path)
	//path, _ := os.Getwd()
	//Casbins, _ = casbin.NewEnforcer(path + "/app/hander/role/auth_model.conf")
}

type CasbinRoleCashins struct {}

type CasbinRole struct {
	RoleId int32 `json:"id"`
	Url string `json:"permission_code"`
	Param string `json:"request_param"`
}

type Temp struct {
	PermissionIds string `json:"permission_ids"`
}


func (*CasbinRoleCashins) CreateRolePermissionRoute (permission interface{}, role_id int32)  {

	var permissions_maps CasbinRole
	f := gconv.Maps(permission, "")
	for _, v := range f {
		_ = gconv.Struct(v, &permissions_maps)
		_, _ = Casbins.AddPolicy(gconv.String(role_id), permissions_maps.Url, permissions_maps.Param)
	}

}


func (*CasbinRoleCashins) CheckRoute (role_id interface{}, route string, param string) (bool, error) {

	return Casbins.Enforce(gconv.String(role_id), route, param)

}




func (*CasbinRoleCashins) Role_permission(role_id int32) bool {

	var redisService redis.RedisService
	var roles interface{}
	err := redisService.GetJsonDecodeDataByKeyName(redis.ADMIN_HASH_ROLE_PERMISSION_AUTH, role_id, &roles)
	if   err != nil || roles != nil {
		return true
	}
	// 如果redis已清除, 重新生成
	var t Temp
	result, err := server.ModelAdminRolePermission.GetByRoleId(role_id)
	if err != nil || result == nil {
		return false
	}
	_ = result.Struct(&t)
	var data []map[string]interface{}
	_ = gjson.DecodeTo(t.PermissionIds, &data)
	slic := redisService.Format(data)
	where 	:= g.Map{
		"id IN(?)" : slic,
		//"status=?" : server.ADMIN_PERMISSION_STATUS_ENABLE,
		"parent_id!=?" : 0,
	}
	permission, _ := server.ModelAdminPermission.GetPermissionListMaps(where)
	permission_role ,_ := json.Marshal(permission)
	_, _ = g.Redis().Do("HSET", redis.ADMIN_HASH_ROLE_PERMISSION_AUTH, role_id, permission_role)

	return true
}