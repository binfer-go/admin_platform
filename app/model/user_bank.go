package model

import "time"

type UserBank struct {
	Id          int32     `plat:"primary_key;id" json:"id"`
	UserId      int32     `plat:"user_id" json:"user_id"`           // 用户ID
	Username    string    `plat:"username" json:"username"`         // 用户名
	BankId      int32     `plat:"bank_id" json:"bank_id"`           // 银行id
	BankName    string    `plat:"bank_name" json:"bank_name"`       // 银行名
	BankNumber  string    `plat:"bank_number" json:"bank_number"`   // 银行卡号
	RealName    string    `plat:"real_name" json:"real_name"`       // 持卡人
	BankAddress string    `plat:"bank_address" json:"bank_address"` // 银行地址
	Status      byte      `plat:"status" json:"status"`             // 1:启用 2：禁用
	Remark      string    `plat:"remark" json:"remark"`             // 备注
	CreatedAt   time.Time `plat:"created_at" json:"created_at"`     // 创建时间
	UpdatedAt   time.Time `plat:"updated_at" json:"updated_at"`     // 更新时间
}

func (*UserBank) TableName() string {
	return "user_bank"
}
