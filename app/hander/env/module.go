package env

var F []string

type State byte

const (
	ADMIN_MODULE State = iota + 1
	ADMIN_MODULE_LOGIN
	ADMIN_MODULE_LOGOUT
	ADMIN_MODULE_ROLE
	ADMIN_MODULE_PERMISSION
	ADMIN_MODULE_ROLE_MAPS
	ADMIN_MODULE_SITE
	ADMIN_MODULE_USER
	ADMIN_MODULE_USER_ACTION
	ADMIN_MODULE_USER_BANK
	ADMIN_MODULE_USER_DEPOSIT
	ADMIN_MODULE_USER_WITHDRAW
	ADMIN_MODULE_TASK
	ADMIN_MODULE_TASK_PUBLISH
	ADMIN_MODULE_TASK_SUBSCRIBE
)


func init()  {

	F = []string {
		ADMIN_MODULE : 					"管理员",
		ADMIN_MODULE_LOGIN : 			"登陆",
		ADMIN_MODULE_LOGOUT : 			"登出",
		ADMIN_MODULE_ROLE : 			"角色管理",
		ADMIN_MODULE_PERMISSION : 		"权限管理",
		ADMIN_MODULE_ROLE_MAPS : 		"权限控制",
		ADMIN_MODULE_SITE : 			"站点配置",
		ADMIN_MODULE_USER : 			"会员",
		ADMIN_MODULE_USER_ACTION : 		"会员状态",
		ADMIN_MODULE_USER_BANK : 		"会员银行卡",
		ADMIN_MODULE_USER_DEPOSIT : 	"会员存款",
		ADMIN_MODULE_USER_WITHDRAW :	"会员取款",
		ADMIN_MODULE_TASK : 			"任务",
		ADMIN_MODULE_TASK_PUBLISH : 	"派单",
		ADMIN_MODULE_TASK_SUBSCRIBE : 	"接单",
	}

}

type M struct {
	Name string `json:"name"`
	Value interface{} `json:"value"`
}
func ModuleConfigs ()  interface{} {

	var ls [16]M
	for k, v := range F {
		ls[k].Name = v
		ls[k].Value= k
	}
    return ls
}