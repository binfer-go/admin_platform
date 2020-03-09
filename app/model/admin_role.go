package model

import "time"

type AdminRole struct {
	Id        int32     `plat:"primary_key;id" json:"id"`
	RoleName  string    `plat:"role_name" json:"role_name"`   // 角色名称
	RoleCode  string    `plat:"role_code" json:"role_code"`   // 角色代号
	Status    byte      `plat:"status" json:"status"`         // 1:启用 2：禁用
	Remark    string    `plat:"remark" json:"remark"`         // 备注
	CreatedAt time.Time `plat:"created_at" json:"created_at"` // 创建时间
	UpdatedAt time.Time `plat:"updated_at" json:"updated_at"` // 更新时间
	CreatedIp string    `plat:"created_ip" json:"created_ip"` // 创建Ip
}

func (*AdminRole) TableName() string {
	return "admin_role"
}
