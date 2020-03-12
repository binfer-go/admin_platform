package model

import "time"

type TaskSubscribe struct {
	Id              int32     `plat:"primary_key;id" json:"id"`
	TaskId          int32     `plat:"task_id" json:"task_id"`                   // 任务id
	TaskType        byte      `plat:"task_type" json:"task_type"`               // 任务类型
	Project         string    `plat:"project" json:"project"`                   // 项目名称
	MerchantId      int32     `plat:"merchant_id" json:"merchant_id"`           // 卖家ID
	MerchantName    string    `plat:"merchant_name" json:"merchant_name"`       // 卖家账号
	MerchantAvatar  string    `plat:"merchant_avatar" json:"merchant_avatar"`   // 卖家头像
	UserId          int32     `plat:"user_id" json:"user_id"`                   // 买家ID
	UserName        string    `plat:"user_name" json:"user_name"`               // 买家账号
	Amount          int32     `plat:"amount" json:"amount"`                     // 任务佣金
	Step            string    `plat:"step" json:"step"`                         // 任务步骤
	Result          string    `plat:"result" json:"result"`                     // 任务提交凭证
	Status          byte      `plat:"status" json:"status"`                     // 1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:已过期 7:复审失败 8:已失败
	AdminAccount    string    `plat:"admin_account" json:"admin_account"`       // 操作人账号
	AcceptTs        int64     `plat:"accept_ts" json:"accept_ts"`               // 领取时间
	CommitTs        int64     `plat:"commit_ts" json:"commit_ts"`               // 提交时间
	VerifyTs        int64     `plat:"verify_ts" json:"verify_ts"`               // 审核时间
	ReportTs        int64     `plat:"report_ts" json:"report_ts"`               // 复审提交时间
	ReportReason    string    `plat:"report_reason" json:"report_reason"`       // 复审举报理由
	ReverifyTs      int64     `plat:"reverify_ts" json:"reverify_ts"`           // 复审时间
	ReverifyRemark  string    `plat:"reverify_remark" json:"reverify_remark"`   // 复审备注
	ReverifyAccount string    `plat:"reverify_account" json:"reverify_account"` // 复审处理人 为空则为商家处理
	ExpireTs        int64     `plat:"expire_ts" json:"expire_ts"`               // 过期时间
	InspectTs       int64     `plat:"inspect_ts" json:"inspect_ts"`             // 审核周期
	AutoCompleteTs  int64     `plat:"auto_complete_ts" json:"auto_complete_ts"` // 自动完成时间
	CommitMsg       string    `plat:"commit_msg" json:"commit_msg"`             // 订单提交信息
	RefuseMsg       string    `plat:"refuse_msg" json:"refuse_msg"`             // 拒绝理由
	Remark          string    `plat:"remark" json:"remark"`                     // 订单备注
	CreatedAt       time.Time `plat:"created_at" json:"created_at"`             // 创建时间
	UpdatedAt       time.Time `plat:"updated_at" json:"updated_at"`             // 更新时间
}

func (*TaskSubscribe) TableName() string {
	return "task_subscribe"
}
