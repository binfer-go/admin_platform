package model

type AdminRolePermission struct {
	Id            int32  `plat:"primary_key;id" json:"id"`
	RoleId        int32  `plat:"role_id" json:"role_id"`               // 角色Id
	PermissionIds string `plat:"permission_ids" json:"permission_ids"` // 权限Id
	Sort          int32  `plat:"sort" json:"sort"`                     // 排序
	Status        byte   `plat:"status" json:"status"`                 // 状态：1:启用 2：禁用
	Module        string `plat:"module" json:"module"`                 // 字段权限补充
}

func (*AdminRolePermission) TableName() string {
	return "admin_role_permission"
}
