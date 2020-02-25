package model

import "time"

type Admin struct {
	Id            int32     `gorm:"primary_key;id" json:"id"`
	RoleId        int32     `gorm:"role_id" json:"role_id"`                 // 角色ID
	Account       string    `gorm:"account" json:"account"`                 // 账户
	NickName      string    `gorm:"nick_name" json:"nick_name"`             // 昵称
	LoginPassword string    `gorm:"login_password" json:"login_password"`   // 登陆密码
	SecretKey     string    `gorm:"secret_key" json:"secret_key"`           // 安全秘钥
	Status        byte      `gorm:"status" json:"status"`                   // 状态：1:启用 2：停用
	CreatedAt     time.Time `gorm:"created_at" json:"created_at"`           // 创建时间
	UpdatedAt     time.Time `gorm:"updated_at" json:"updated_at"`           // 更新时间
	CreatedId     int32     `gorm:"created_id" json:"created_id"`           // 创建管理ID
	CreatedIp     string    `gorm:"created_ip" json:"created_ip"`           // 创建Ip
	LastLoginIp   string    `gorm:"last_login_ip" json:"last_login_ip"`     // 最后登陆ip
	LoginCount    int32     `gorm:"login_count" json:"login_count"`         // 登陆次数
	LastLoginTime time.Time `gorm:"last_login_time" json:"last_login_time"` // 最后登陆时间
}

func (*Admin) TableName() string {
	return "admin"
}
