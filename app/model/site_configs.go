package model

import "time"

type SiteConfigs struct {
	Id              int32     `plat:"primary_key;id" json:"id"`
	OptionName      string    `plat:"option_name" json:"option_name"`             // 选项名称
	OptionCode      string    `plat:"option_code" json:"option_code"`             // 选项code
	OptionDescribe  string    `plat:"option_describe" json:"option_describe"`     // 选项描述
	TypeId          int32     `plat:"type_id" json:"type_id"`                     // 配置类型
	FromId          int32     `plat:"from_id" json:"from_id"`                     // 表单类型
	BussinessTypeId int32     `plat:"bussiness_type_id" json:"bussiness_type_id"` // 业务类型
	Units           string    `plat:"units" json:"units"`                         // 单位
	ValueType       byte      `plat:"value_type" json:"value_type"`               // 值类型; 1: integer 2: string 3:float
	Value           string    `plat:"value" json:"value"`                         // 值
	CreatedAt       time.Time `plat:"created_at" json:"created_at"`               // 创建时间
	UpdatedAt       time.Time `plat:"updated_at" json:"updated_at"`               // 更新时间
}

func (*SiteConfigs) TableName() string {
	return "site_configs"
}
