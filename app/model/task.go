package model

import "time"

type Task struct {
	Id          int32     `plat:"primary_key;id" json:"id"`
	Title       string    `plat:"title" json:"title"`               // 任务标题
	Describe    string    `plat:"describe" json:"describe"`         // 任务描述
	Status      byte      `plat:"status" json:"status"`             // 1:上架 2:下架 3：删除
	Sort        int32     `plat:"sort" json:"sort"`                 // 排序
	SubmitTime  string    `plat:"submit_time" json:"submit_time"`   // 提交时限
	InspectTime string    `plat:"inspect_time" json:"inspect_time"` // 审核周期
	CreatedAt   time.Time `plat:"created_at" json:"created_at"`     // 创建时间
	UpdatedAt   time.Time `plat:"updated_at" json:"updated_at"`     // 更新时间
}

func (*Task) TableName() string {
	return "task"
}
