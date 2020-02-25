package model

import "time"

type Bill struct {
	Id           int64     `gorm:"primary_key;id" json:"id"`
	UserId       int32     `gorm:"user_id" json:"user_id"`             // 用户ID
	Username     string    `gorm:"username" json:"username"`           // 用户名
	Type         byte      `gorm:"type" json:"type"`                   // 账变类型(0:扣钱 1:加钱)
	Operate      byte      `gorm:"operate" json:"operate"`             // 1:存款 2:取款 3:发布任务 4:佣金
	Src          int32     `gorm:"src" json:"src"`                     // 来源ID，默认为系统：0
	Amount       int32     `gorm:"amount" json:"amount"`               // 交易金额
	BeforeAmount int32     `gorm:"before_amount" json:"before_amount"` // 变动前金额
	AfterAmount  int32     `gorm:"after_amount" json:"after_amount"`   // 变动后金额
	Desc         string    `gorm:"desc" json:"desc"`                   // 账变描述
	CreatedAt    time.Time `gorm:"created_at" json:"created_at"`       // 创建时间
	UpdatedAt    time.Time `gorm:"updated_at" json:"updated_at"`       // 更新时间
}

func (*Bill) TableName() string {
	return "bill"
}
