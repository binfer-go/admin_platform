package model

import "time"

type UserActionStatus struct {
	Id              int32     `plat:"primary_key;id" json:"id"`
	UserId          int32     `plat:"user_id" json:"user_id"`                   // 会员Id
	Phone           string    `plat:"phone" json:"phone"`                       // 电话
	PublishStatus   int64     `plat:"publish_status" json:"publish_status"`     // 发布任务限制时间
	SubscribeStatus int64     `plat:"subscribe_status" json:"subscribe_status"` // 接受任务限制时间
	WithdrawStatus  int64     `plat:"withdraw_status" json:"withdraw_status"`   // 提现限制时间
	MessageStatus   int64     `plat:"message_status" json:"message_status"`     // 发送消息限制时间
	LoginStatus     int64     `plat:"login_status" json:"login_status"`         // 登陆限制时间
	Remark          string    `plat:"remark" json:"remark"`                     // 备注
	Image           string    `plat:"image" json:"image"`                       // 图片凭证
	CreatedAt       time.Time `plat:"created_at" json:"created_at"`             // 创建时间
}

func (*UserActionStatus) TableName() string {
	return "user_action_status"
}
