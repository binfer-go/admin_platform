package model

import "time"

type TaskReport struct {
	Id           int32     `plat:"primary_key;id" json:"id"`
	TaskId       int32     `plat:"task_id" json:"task_id"`             // 任务id
	UserId       int32     `plat:"user_id" json:"user_id"`             // 用户Id
	UserName     string    `plat:"user_name" json:"user_name"`         // 用户名字
	MerchantId   int32     `plat:"merchant_id" json:"merchant_id"`     // 商户Id
	MerchantName string    `plat:"merchant_name" json:"merchant_name"` // 商户名字
	Reason       string    `plat:"reason" json:"reason"`               // 举报原因
	Umask        byte      `plat:"umask" json:"umask"`                 // 状态位
	Remark       string    `plat:"remark" json:"remark"`               // 备注
	CreatedAt    time.Time `plat:"created_at" json:"created_at"`       // 创建时间
	UpdatedAt    time.Time `plat:"updated_at" json:"updated_at"`       // 更新时间
}

func (*TaskReport) TableName() string {
	return "task_report"
}
