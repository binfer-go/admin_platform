package model

import "time"

type User struct {
	Id               int32     `gorm:"primary_key;id" json:"id"`                   // 用户id
	Username         string    `gorm:"username" json:"username"`                   // 用户名
	Nickname         string    `gorm:"nickname" json:"nickname"`                   // 昵称
	Password         string    `gorm:"password" json:"password"`                   // 用户密码
	WithdrawPassword string    `gorm:"withdraw_password" json:"withdraw_password"` // 提现密码
	ParentId         int32     `gorm:"parent_id" json:"parent_id"`                 // 上级id
	AgentJoin        string    `gorm:"agent_join" json:"agent_join"`               // 代理线
	RealName         string    `gorm:"real_name" json:"real_name"`                 // 真实姓名
	Phone            string    `gorm:"phone" json:"phone"`                         // 手机号
	Balance          int32     `gorm:"balance" json:"balance"`                     // 发布余额
	Commission       int32     `gorm:"commission" json:"commission"`               // 佣金
	Avatar           string    `gorm:"avatar" json:"avatar"`                       // 头像链接
	CreatedAt        time.Time `gorm:"created_at" json:"created_at"`               // 创建时间
	UpdatedAt        time.Time `gorm:"updated_at" json:"updated_at"`               // 更新时间
	RegIp            string    `gorm:"reg_ip" json:"reg_ip"`                       // 注册ip
	LastIp           string    `gorm:"last_ip" json:"last_ip"`                     // 最后登录ip
	Status           byte      `gorm:"status" json:"status"`                       // 0:启用 1:禁用
}

func (*User) TableName() string {
	return "user"
}
