package model

import "time"

type Bill struct {
	Id           int64     `plat:"primary_key;id" json:"id"`
	UserId       int32     `plat:"user_id" json:"user_id"`             // 用户ID
	Username     string    `plat:"username" json:"username"`           // 用户名
	Phone        string    `plat:"phone" json:"phone"`                 // 手机号
	Type         byte      `plat:"type" json:"type"`                   // 账变类型(1:加钱 2:扣钱)
	Operate      byte      `plat:"operate" json:"operate"`             // 1:存款 2:取款 3:发布任务 4:佣金 5:任务结束退回 6:提取佣金
	Src          int32     `plat:"src" json:"src"`                     // 来源ID，默认为系统：0
	Role         byte      `plat:"role" json:"role"`                   // 账变角色
	Amount       int32     `plat:"amount" json:"amount"`               // 交易金额
	BeforeAmount int32     `plat:"before_amount" json:"before_amount"` // 变动前金额
	AfterAmount  int32     `plat:"after_amount" json:"after_amount"`   // 变动后金额
	Desc         string    `plat:"desc" json:"desc"`                   // 账变描述
	CreatedAt    time.Time `plat:"created_at" json:"created_at"`       // 创建时间
	UpdatedAt    time.Time `plat:"updated_at" json:"updated_at"`       // 更新时间
}

func (*Bill) TableName() string {
	return "bill"
}
