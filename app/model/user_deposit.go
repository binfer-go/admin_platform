package model

import "time"

type UserDeposit struct {
	Id           int32     `gorm:"primary_key;id" json:"id"`
	UserId       int32     `gorm:"user_id" json:"user_id"`             // 用户ID
	Username     string    `gorm:"username" json:"username"`           // 用户名
	PayType      byte      `gorm:"pay_type" json:"pay_type"`           // 1:支付宝 2:微信 3:银行卡转账
	Amount       int32     `gorm:"amount" json:"amount"`               // 交易金额
	RealAmount   int32     `gorm:"real_amount" json:"real_amount"`     // 实际到账金额
	BankId       int32     `gorm:"bank_id" json:"bank_id"`             // 用户银行卡ID(备用)
	BankName     string    `gorm:"bank_name" json:"bank_name"`         // 用户银行卡名称(备用)
	Status       byte      `gorm:"status" json:"status"`               // 0:等待支付 1:成功 2:失败 3:待人工审核
	AdminAccount string    `gorm:"admin_account" json:"admin_account"` // 操作人账号
	CreatedAt    time.Time `gorm:"created_at" json:"created_at"`       // 创建时间
	UpdatedAt    time.Time `gorm:"updated_at" json:"updated_at"`       // 变动时间
}

func (*UserDeposit) TableName() string {
	return "user_deposit"
}
