package model

import "time"

type AdminRole struct {
	Id        int32     `gorm:"primary_key;id" json:"id"`
	RoleName  string    `gorm:"role_name" json:"role_name"`   // 角色名称
	RoleCode  string    `gorm:"role_code" json:"role_code"`   // 角色代号
	Status    byte      `gorm:"status" json:"status"`         // 1:启用 2：禁用
	Remark    string    `gorm:"remark" json:"remark"`         // 备注
	CreatedAt time.Time `gorm:"created_at" json:"created_at"` // 创建时间
	UpdatedAt time.Time `gorm:"updated_at" json:"updated_at"` // 更新时间
	CreatedIp string    `gorm:"created_ip" json:"created_ip"` // 创建Ip
}

func (*AdminRole) TableName() string {
	return "admin_role"
}
