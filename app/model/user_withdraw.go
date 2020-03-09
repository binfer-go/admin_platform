package model

import "time"

type UserWithdraw struct {
	Id           int32     `plat:"primary_key;id" json:"id"`
	UserId       int32     `plat:"user_id" json:"user_id"`             // 用户ID
	Username     string    `plat:"username" json:"username"`           // 用户名
	Phone        string    `plat:"phone" json:"phone"`                 // 电话
	Amount       int32     `plat:"amount" json:"amount"`               // 交易金额
	RealAmount   int32     `plat:"real_amount" json:"real_amount"`     // 实际扣除金额
	BankId       int32     `plat:"bank_id" json:"bank_id"`             // 用户银行卡ID(备用)
	BankName     string    `plat:"bank_name" json:"bank_name"`         // 用户银行卡名称(备用)
	Status       byte      `plat:"status" json:"status"`               // 1:处理中 2:成功 3:失败
	Operate      byte      `plat:"operate" json:"operate"`             // 1:提现 2:人工扣款 3:发布任务 4:佣金转化
	Wallet       byte      `plat:"wallet" json:"wallet"`               // 1:余额 2:佣金
	AdminAccount string    `plat:"admin_account" json:"admin_account"` // 操作人账号
	Title        string    `plat:"title" json:"title"`                 // 标题
	CreatedAt    time.Time `plat:"created_at" json:"created_at"`       // 创建时间
	UpdatedAt    time.Time `plat:"updated_at" json:"updated_at"`       // 变动时间
}

func (*UserWithdraw) TableName() string {
	return "user_withdraw"
}
