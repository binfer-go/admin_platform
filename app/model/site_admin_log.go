package model

import "time"

type SiteAdminLog struct {
	Id              int32     `plat:"primary_key;id" json:"id"`
	Level           byte      `plat:"level" json:"level"`                         // 日志等级 1:普通 2：警告 3：严重
	Module          byte      `plat:"module" json:"module"`                       // 模块
	Action          byte      `plat:"action" json:"action"`                       // 行为：1:create，2:update，3:delete，4:select，5:other
	Title           string    `plat:"title" json:"title"`                         // 标题
	Description     string    `plat:"description" json:"description"`             // 描述
	ActionAdminId   int32     `plat:"action_admin_id" json:"action_admin_id"`     // 管理员ID
	ActionAdminName string    `plat:"action_admin_name" json:"action_admin_name"` // 管理员账户
	ActionUserId    int32     `plat:"action_user_id" json:"action_user_id"`       // 被操作人ID
	ActionUserName  string    `plat:"action_user_name" json:"action_user_name"`   // 被操作人账户
	ActionAdminIp   string    `plat:"action_admin_ip" json:"action_admin_ip"`     // 操作者ip
	CreatedAt       time.Time `plat:"created_at" json:"created_at"`               // 创建时间
}

func (*SiteAdminLog) TableName() string {
	return "site_admin_log"
}
