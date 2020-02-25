package model

import "time"

type UserWithdraw struct {
	Id           int32     `gorm:"primary_key;id" json:"id"`
	UserId       int32     `gorm:"user_id" json:"user_id"`             // 用户ID
	Username     string    `gorm:"username" json:"username"`           // 用户名
	Amount       int32     `gorm:"amount" json:"amount"`               // 提现金额
	BankId       int64     `gorm:"bank_id" json:"bank_id"`             // 银行卡卡号
	BankName     string    `gorm:"bank_name" json:"bank_name"`         // 银行名字
	Status       byte      `gorm:"status" json:"status"`               // 状态：1：提现中 2：审核中 3：成功 4：拒绝
	AdminAccount string    `gorm:"admin_account" json:"admin_account"` // 操作人账号
	CreatedAt    time.Time `gorm:"created_at" json:"created_at"`       // 创建时间
	UpdatedAt    time.Time `gorm:"updated_at" json:"updated_at"`       // 变更时间
}

func (*UserWithdraw) TableName() string {
	return "user_withdraw"
}
