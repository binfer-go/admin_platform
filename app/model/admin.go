package model

import "time"

type Admin struct {
	Id            int32     `plat:"primary_key;id" json:"id"`
	RoleId        int32     `plat:"role_id" json:"role_id"`                 // 角色ID
	RoleName      string    `plat:"role_name" json:"role_name"`             // 角色名
	Account       string    `plat:"account" json:"account"`                 // 账户
	NickName      string    `plat:"nick_name" json:"nick_name"`             // 昵称
	LoginPassword string    `plat:"login_password" json:"login_password"`   // 登陆密码
	SecretKey     string    `plat:"secret_key" json:"secret_key"`           // 安全秘钥
	Status        byte      `plat:"status" json:"status"`                   // 状态：1:启用 2：停用
	CreatedAt     time.Time `plat:"created_at" json:"created_at"`           // 创建时间
	UpdatedAt     time.Time `plat:"updated_at" json:"updated_at"`           // 更新时间
	CreatedId     int32     `plat:"created_id" json:"created_id"`           // 创建管理ID
	CreatedIp     string    `plat:"created_ip" json:"created_ip"`           // 创建Ip
	LastLoginIp   string    `plat:"last_login_ip" json:"last_login_ip"`     // 最后登陆ip
	LoginCount    int32     `plat:"login_count" json:"login_count"`         // 登陆次数
	LastLoginTime time.Time `plat:"last_login_time" json:"last_login_time"` // 最后登陆时间
}

func (*Admin) TableName() string {
	return "admin"
}
