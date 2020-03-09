package model

import "time"

type AdminPermission struct {
	Id             int32     `plat:"primary_key;id" json:"id"`
	ParentId       int32     `plat:"parent_id" json:"parent_id"`             // 上级id
	Joins          string    `plat:"joins" json:"joins"`                     // id路径
	PermissionName string    `plat:"permission_name" json:"permission_name"` // 权限名称
	PermissionCode string    `plat:"permission_code" json:"permission_code"` // 权限code
	PermissionPath string    `plat:"permission_path" json:"permission_path"` // 前端模板路径
	RequestParam   string    `plat:"request_param" json:"request_param"`     // 请求方法:get,post,put,patch,options
	Sort           int32     `plat:"sort" json:"sort"`                       // 排序
	Type           byte      `plat:"type" json:"type"`                       // 菜单类型： 1：菜单 2：路由 3：按钮
	Status         byte      `plat:"status" json:"status"`                   // 状态1：显示 2：隐藏
	CreatedAt      time.Time `plat:"created_at" json:"created_at"`           // 创建时间
	UpdatedAt      time.Time `plat:"updated_at" json:"updated_at"`           // 更新时间
	CreatedIp      string    `plat:"created_ip" json:"created_ip"`           // 创建者Ip
}

func (*AdminPermission) TableName() string {
	return "admin_permission"
}
