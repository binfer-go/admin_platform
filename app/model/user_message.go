package model

import "time"

type UserMessage struct {
	Id        int32     `gorm:"primary_key;id" json:"id"`
	UserId    int32     `gorm:"user_id" json:"user_id"`       // 用户id
	Title     string    `gorm:"title" json:"title"`           // 标题
	Content   string    `gorm:"content" json:"content"`       // 内容
	CreatedAt time.Time `gorm:"created_at" json:"created_at"` // 创建时间
	Status    byte      `gorm:"status" json:"status"`         // 状态 1:已删除
}

func (*UserMessage) TableName() string {
	return "user_message"
}
