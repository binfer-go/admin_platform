package model

import "time"

type TaskPublish struct {
	Id           int32     `gorm:"primary_key;id" json:"id"`
	UserId       int32     `gorm:"user_id" json:"user_id"`             // 用户ID
	Username     string    `gorm:"username" json:"username"`           // 用户名
	Avatar       string    `gorm:"avatar" json:"avatar"`               // 用户头像
	TaskType     byte      `gorm:"task_type" json:"task_type"`         // 任务类型ID
	Project      string    `gorm:"project" json:"project"`             // 项目名称
	Title        string    `gorm:"title" json:"title"`                 // 任务标题
	Describe     string    `gorm:"describe" json:"describe"`           // 任务描述
	Link         string    `gorm:"link" json:"link"`                   // 任务链接
	Amount       int32     `gorm:"amount" json:"amount"`               // 任务金额
	LimitCount   int32     `gorm:"limit_count" json:"limit_count"`     // 任务限制人数
	Count        int32     `gorm:"count" json:"count"`                 // 已接人数
	AdminAccount string    `gorm:"admin_account" json:"admin_account"` // 操作人账号
	Step         string    `gorm:"step" json:"step"`                   // 任务步骤
	Status       byte      `gorm:"status" json:"status"`               // 1:待发布 2:待审核3:已通过 4:已拒绝 5:已关闭 6:已删除
	ExpireTs     int64     `gorm:"expire_ts" json:"expire_ts"`         // 过期时间
	InspectTs    int64     `gorm:"inspect_ts" json:"inspect_ts"`       // 检查时间
	StartTime    time.Time `gorm:"start_time" json:"start_time"`       // 任务开始时间
	FinishTime   time.Time `gorm:"finish_time" json:"finish_time"`     // 任务结束时间
	CreatedAt    time.Time `gorm:"created_at" json:"created_at"`       // 创建时间
	UpdatedAt    time.Time `gorm:"updated_at" json:"updated_at"`       // 更新时间
}

func (*TaskPublish) TableName() string {
	return "task_publish"
}
