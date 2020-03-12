package model

import "time"

type ReportBases struct {
	Id                              int32     `plat:"primary_key;id" json:"id"`
	Date                            time.Time `plat:"date" json:"date"`                                                               // 日期
	UserId                          int32     `plat:"user_id" json:"user_id"`                                                         // 会员id
	UserParentId                    int32     `plat:"user_parent_id" json:"user_parent_id"`                                           // 上级Id
	UserPhone                       string    `plat:"user_phone" json:"user_phone"`                                                   // 会员电话
	UserBalance                     int32     `plat:"user_balance" json:"user_balance"`                                               // 发布钱包
	UserCommission                  int32     `plat:"user_commission" json:"user_commission"`                                         // 佣金钱包
	TaskPublishCount                int32     `plat:"task_publish_count" json:"task_publish_count"`                                   // 发布任务数
	TaskPublishMoneySum             int32     `plat:"task_publish_money_sum" json:"task_publish_money_sum"`                           // 发布任务金额
	TaskPublishAcceptCount          int32     `plat:"task_publish_accept_count" json:"task_publish_accept_count"`                     // 做单人数
	TaskPublishSuccessAcceptCount   int32     `plat:"task_publish_success_accept_count" json:"task_publish_success_accept_count"`     // 已成功人数
	TaskPublishEndCount             int32     `plat:"task_publish_end_count" json:"task_publish_end_count"`                           // 发布结束任务数
	TaskPublishSuccessCount         int32     `plat:"task_publish_success_count" json:"task_publish_success_count"`                   // 发布成功任务数
	TaskPublishChildrenCount        int32     `plat:"task_publish_children_count" json:"task_publish_children_count"`                 // 发布子任务数量
	TaskPublishChildrenFailureCount int32     `plat:"task_publish_children_failure_count" json:"task_publish_children_failure_count"` // 发布子任务失败数量(自身发布)
	TaskPublishChildrenSuccessCount int32     `plat:"task_publish_children_success_count" json:"task_publish_children_success_count"` // 发布子任务成功数量(自身发布)
	TaskPublishChildrenWaitCount    int32     `plat:"task_publish_children_wait_count" json:"task_publish_children_wait_count"`       // 发布子任务进行中数量(自身发布)
	TaskSubscribeCount              int32     `plat:"task_subscribe_count" json:"task_subscribe_count"`                               // 订阅任务总量（其他会员发布）
	TaskSubscribeMoneySum           int32     `plat:"task_subscribe_money_sum" json:"task_subscribe_money_sum"`                       // 订阅任务金额（其他会员发布）
	TaskSubscribeStatusSuccessCount int32     `plat:"task_subscribe_status_success_count" json:"task_subscribe_status_success_count"` // 成功的任务量（其他会员发布）
	TaskSubscribeStatusFailureCount int32     `plat:"task_subscribe_status_failure_count" json:"task_subscribe_status_failure_count"` // 失败的任务量（其他会员发布）
	TaskSubscribeStatusWaitCount    int32     `plat:"task_subscribe_status_wait_count" json:"task_subscribe_status_wait_count"`       // 进行中的任务量（其他会员发布）
	UserDepositCount                int32     `plat:"user_deposit_count" json:"user_deposit_count"`                                   // 充值次数
	UserDepositMoneySum             int32     `plat:"user_deposit_money_sum" json:"user_deposit_money_sum"`                           // 充值金额
	UserDepositMoneyMax             int32     `plat:"user_deposit_money_max" json:"user_deposit_money_max"`                           // 最大充值金额
	UserDepositManualMoneySum       int32     `plat:"user_deposit_manual_money_sum" json:"user_deposit_manual_money_sum"`             // 人工存款总额
	UserDepositManualMoneyCount     int32     `plat:"user_deposit_manual_money_count" json:"user_deposit_manual_money_count"`         // 人工存款笔数
	UserDepositManualMoneyMax       int32     `plat:"user_deposit_manual_money_max" json:"user_deposit_manual_money_max"`             // 人工存款最大额度
	UserWithdrawCount               int32     `plat:"user_withdraw_count" json:"user_withdraw_count"`                                 // 取款次数
	UserWithdrawMoneySum            int32     `plat:"user_withdraw_money_sum" json:"user_withdraw_money_sum"`                         // 取款金额
	UserWithdrawMoneyMax            int32     `plat:"user_withdraw_money_max" json:"user_withdraw_money_max"`                         // 最大取款金额
	UserWithdrawManualMoneySum      int32     `plat:"user_withdraw_manual_money_sum" json:"user_withdraw_manual_money_sum"`           // 人工扣款金额
	UserWithdrawManualMoneyCount    int32     `plat:"user_withdraw_manual_money_count" json:"user_withdraw_manual_money_count"`       // 人工扣款笔数
	UserWithdrawManualMoneyMax      int32     `plat:"user_withdraw_manual_money_max" json:"user_withdraw_manual_money_max"`           // 人工扣款最大额度
	CreatedAt                       time.Time `plat:"created_at" json:"created_at"`
	UpdatedAt                       time.Time `plat:"updated_at" json:"updated_at"`
}

func (*ReportBases) TableName() string {
	return "report_bases"
}
