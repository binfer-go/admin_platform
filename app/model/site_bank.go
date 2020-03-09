package model

type SiteBank struct {
	Id       int32  `plat:"primary_key;id" json:"id"`
	Icon     string `plat:"icon" json:"icon"`           // 银行图标
	BankCode string `plat:"bank_code" json:"bank_code"` // 银行代称
	BankName string `plat:"bank_name" json:"bank_name"` // 银行名称
	Status   byte   `plat:"status" json:"status"`       // 1：启用 2：禁用
}

func (*SiteBank) TableName() string {
	return "site_bank"
}
