package model

import "time"

type SiteConfigsType struct {
	Id        int32     `plat:"primary_key;id" json:"id"`
	Name      string    `plat:"name" json:"name"`             // 类型名称
	Status    byte      `plat:"status" json:"status"`         // 1: 启用 2：禁用
	CreatedAt time.Time `plat:"created_at" json:"created_at"` // 创建时间
	UpdatedAt time.Time `plat:"updated_at" json:"updated_at"` // 更新时间
}

func (*SiteConfigsType) TableName() string {
	return "site_configs_type"
}
