package model

import "time"

type ReportUsers struct {
	Id                       int32     `plat:"primary_key;id" json:"id"`                                         // 用户数据累计表
	UserId                   int32     `plat:"user_id" json:"user_id"`                                           // 用户id
	UserParentId             int32     `plat:"user_parent_id" json:"user_parent_id"`                             // 直属上级
	Phone                    string    `plat:"phone" json:"phone"`                                               // 用户电话
	Username                 string    `plat:"username" json:"username"`                                         // 用户名
	UserChildrerCount        int32     `plat:"user_childrer_count" json:"user_childrer_count"`                   // 下级会员个数
	TaskPubCount             int32     `plat:"task_pub_count" json:"task_pub_count"`                             // 发布任务数
	TaskPubChildrerCount     int32     `plat:"task_pub_childrer_count" json:"task_pub_childrer_count"`           // 发布任务量(子任务)
	TaskPubEndCount          int32     `plat:"task_pub_end_count" json:"task_pub_end_count"`                     // 结束的发布任务数
	TaskPubEndChildrerCount  int32     `plat:"task_pub_end_childrer_count" json:"task_pub_end_childrer_count"`   // 结束的发布任务量
	TaskPubWaitCount         int32     `plat:"task_pub_wait_count" json:"task_pub_wait_count"`                   // 进行中的发布任务数
	TaskPubWaitChildrerCount int32     `plat:"task_pub_wait_childrer_count" json:"task_pub_wait_childrer_count"` // 进行中的任务发布量
	TaskSubWaitCount         int32     `plat:"task_sub_wait_count" json:"task_sub_wait_count"`                   // 进行中的接单数
	TaskSubEndCount          int32     `plat:"task_sub_end_count" json:"task_sub_end_count"`                     // 已完成的接单数
	ComissionTaskSum         int32     `plat:"comission_task_sum" json:"comission_task_sum"`                     // 佣金(任务佣金)
	ComissionPromotionSum    int32     `plat:"comission_promotion_sum" json:"comission_promotion_sum"`           // 佣金(推广佣金)
	WithdrawTaskSum          int32     `plat:"withdraw_task_sum" json:"withdraw_task_sum"`                       // 提现(任务钱包提现)
	WithdrawMasterSum        int32     `plat:"withdraw_master_sum" json:"withdraw_master_sum"`                   // 提现(主钱包提现)
	DepositTaskSum           int32     `plat:"deposit_task_sum" json:"deposit_task_sum"`                         // 任务钱包收益
	DepositMasterSum         int32     `plat:"deposit_master_sum" json:"deposit_master_sum"`                     // 主钱包收益
	LoginCount               int32     `plat:"login_count" json:"login_count"`                                   // 累计登陆次数
	CreatedAt                time.Time `plat:"created_at" json:"created_at"`                                     // 注册时间
	UpdatedAt                time.Time `plat:"updated_at" json:"updated_at"`                                     // 最后更新时间
}

func (*ReportUsers) TableName() string {
	return "report_users"
}
