package model

import "time"

type Task struct {
	Id        int32     `gorm:"primary_key;id" json:"id"`
	Title     string    `gorm:"title" json:"title"`           // 任务标题
	Describe  string    `gorm:"describe" json:"describe"`     // 任务描述
	Status    byte      `gorm:"status" json:"status"`         // 0:启用 1:禁用
	Sort      int32     `gorm:"sort" json:"sort"`             // 排序
	CreatedAt time.Time `gorm:"created_at" json:"created_at"` // 创建时间
	UpdatedAt time.Time `gorm:"updated_at" json:"updated_at"` // 更新时间
}

func (*Task) TableName() string {
	return "task"
}
