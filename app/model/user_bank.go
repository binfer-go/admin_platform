package model

import "time"

type UserBank struct {
	Id          int32     `gorm:"primary_key;id" json:"id"`
	UserId      int32     `gorm:"user_id" json:"user_id"`           // 用户ID
	Username    string    `gorm:"username" json:"username"`         // 用户名
	BankName    string    `gorm:"bank_name" json:"bank_name"`       // 银行名
	BankNumber  string    `gorm:"bank_number" json:"bank_number"`   // 银行卡号
	RealName    string    `gorm:"real_name" json:"real_name"`       // 持卡人
	BankAddress string    `gorm:"bank_address" json:"bank_address"` // 银行地址
	CreatedAt   time.Time `gorm:"created_at" json:"created_at"`     // 创建时间
	UpdatedAt   time.Time `gorm:"updated_at" json:"updated_at"`     // 更新时间
}

func (*UserBank) TableName() string {
	return "user_bank"
}
