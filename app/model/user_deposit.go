package model

import "time"

type UserDeposit struct {
	Id           int32     `plat:"primary_key;id" json:"id"`
	UserId       int32     `plat:"user_id" json:"user_id"`             // 用户ID
	Username     string    `plat:"username" json:"username"`           // 用户名
	Phone        string    `plat:"phone" json:"phone"`                 // 电话
	PayType      byte      `plat:"pay_type" json:"pay_type"`           // 充值类型 1:支付宝 2:微信 3:银行卡转账
	Amount       int32     `plat:"amount" json:"amount"`               // 交易金额
	RealAmount   int32     `plat:"real_amount" json:"real_amount"`     // 实际到账金额
	Status       byte      `plat:"status" json:"status"`               // 1:处理中 2:成功 3:失败 4:待审核
	Operate      byte      `plat:"operate" json:"operate"`             // 1:充值 2:人工加款 3:任务结束退款 4:佣金转化
	Wallet       byte      `plat:"wallet" json:"wallet"`               // 1:余额 2:佣金
	AdminAccount string    `plat:"admin_account" json:"admin_account"` // 操作人账号
	Title        string    `plat:"title" json:"title"`                 // 标题
	CreatedAt    time.Time `plat:"created_at" json:"created_at"`       // 创建时间
	UpdatedAt    time.Time `plat:"updated_at" json:"updated_at"`       // 变动时间
}

func (*UserDeposit) TableName() string {
	return "user_deposit"
}
