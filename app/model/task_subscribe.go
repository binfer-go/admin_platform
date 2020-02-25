package model

import "time"

type TaskSubscribe struct {
	Id             int32     `gorm:"primary_key;id" json:"id"`
	TaskType       byte      `gorm:"task_type" json:"task_type"`             // 任务类型
	Project        string    `gorm:"project" json:"project"`                 // 项目名称
	MerchantId     int32     `gorm:"merchant_id" json:"merchant_id"`         // 卖家ID
	MerchantName   string    `gorm:"merchant_name" json:"merchant_name"`     // 卖家账号
	MerchantAvatar string    `gorm:"merchant_avatar" json:"merchant_avatar"` // 卖家头像
	UserId         int32     `gorm:"user_id" json:"user_id"`                 // 买家ID
	UserName       string    `gorm:"user_name" json:"user_name"`             // 买家账号
	Amount         int32     `gorm:"amount" json:"amount"`                   // 任务佣金
	Step           string    `gorm:"step" json:"step"`                       // 任务步骤
	Status         byte      `gorm:"status" json:"status"`                   // 1:进行中2:已提交 3:已拒绝 4:重新提交 5:已结算
	AdminAccount   string    `gorm:"admin_account" json:"admin_account"`     // 操作人账号
	ExpireTs       int64     `gorm:"expire_ts" json:"expire_ts"`             // 过期时间
	CommitMsg      string    `gorm:"commit_msg" json:"commit_msg"`           // 订单提交信息
	Remark         string    `gorm:"remark" json:"remark"`                   // 订单备注
	CreatedAt      time.Time `gorm:"created_at" json:"created_at"`           // 创建时间
	UpdatedAt      time.Time `gorm:"updated_at" json:"updated_at"`           // 更新时间
}

func (*TaskSubscribe) TableName() string {
	return "task_subscribe"
}
