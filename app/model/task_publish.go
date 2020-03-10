package model

import "time"

type TaskPublish struct {
	Id                int32     `plat:"primary_key;id" json:"id"`
	UserId            int32     `plat:"user_id" json:"user_id"`             // 用户ID
	Username          string    `plat:"username" json:"username"`           // 用户名
	Avatar            string    `plat:"avatar" json:"avatar"`               // 用户头像
	TaskType          byte      `plat:"task_type" json:"task_type"`         // 任务类型ID
	Project           string    `plat:"project" json:"project"`             // 项目名称
	Title             string    `plat:"title" json:"title"`                 // 任务标题
	Describe          string    `plat:"describe" json:"describe"`           // 任务描述
	Link              string    `plat:"link" json:"link"`                   // 任务链接
	Amount            int32     `plat:"amount" json:"amount"`               // 任务金额
	Accept            int32     `plat:"accept" json:"accept"`               // 做单人数
	Commit            int32     `plat:"commit" json:"commit"`               // 待审核人数
	Success           int32     `plat:"success" json:"success"`             // 已通过人数
	Count             int32     `plat:"count" json:"count"`                 // 任务数量
	AdminAccount      string    `plat:"admin_account" json:"admin_account"` // 操作人账号
	Step              string    `plat:"step" json:"step"`                   // 任务步骤
	Rate              float64   `plat:"rate" json:"rate"`
	Status            byte      `plat:"status" json:"status"`                         // 1:待发布 2:待审核3:已通过 4:已拒绝 5:已结束
	RefuseRemark      string    `plat:"refuse_remark" json:"refuse_remark"`           // 拒绝原因
	UnavailableRemark string    `plat:"unavailable_remark" json:"unavailable_remark"` // 禁用原因
	ExpireTs          int64     `plat:"expire_ts" json:"expire_ts"`                   // 过期时间
	InspectTs         int64     `plat:"inspect_ts" json:"inspect_ts"`                 // 检查时间
	StartTs           int64     `plat:"start_ts" json:"start_ts"`                     // 任务开始时间
	FinishTs          int64     `plat:"finish_ts" json:"finish_ts"`                   // 任务结束时间
	CreatedAt         time.Time `plat:"created_at" json:"created_at"`                 // 创建时间
	UpdatedAt         time.Time `plat:"updated_at" json:"updated_at"`                 // 更新时间
}

func (*TaskPublish) TableName() string {
	return "task_publish"
}
