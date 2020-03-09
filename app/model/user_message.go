package model

import "time"

type UserMessage struct {
	Id        int32     `plat:"primary_key;id" json:"id"`
	UserId    int32     `plat:"user_id" json:"user_id"`       // 用户id
	Title     string    `plat:"title" json:"title"`           // 标题
	Content   string    `plat:"content" json:"content"`       // 内容
	CreatedAt time.Time `plat:"created_at" json:"created_at"` // 创建时间
	Status    byte      `plat:"status" json:"status"`         // 状态 1:已删除
}

func (*UserMessage) TableName() string {
	return "user_message"
}
