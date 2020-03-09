package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/hander/env"
	"platform/app/model"
	"platform/library/response"
	"time"
)

const (
	// 行为
	ADMIN_LOG_ACTION_CREATE 	= byte(1)
	ADMIN_LOG_ACTION_UPDATE 	= byte(2)
	ADMIN_LOG_ACTION_SELECT 	= byte(3)
	ADMIN_LOG_ACTION_DELETE 	= byte(4)
	ADMIN_LOG_ACTION_OTHER 		= byte(5)

	// 等级
	ADMIN_LOG_LEVEL_INFO 		= byte(1)
	ADMIN_LOG_LEVEL_WARNING 	= byte(2)
	ADMIN_LOG_LEVEL_ERROR 		= byte(3)

)

var (
	ModelAdminLog  *ServerAdminLogs
	tableAdminLog = g.DB().Table(new(model.SiteAdminLog).TableName()).Safe()
)

type ServerAdminLogs struct {}

type AdminLogOption func(options *AdminLogOptions)

type AdminLogOptions struct {
	Level           byte      `gorm:"level" json:"level"`                         // 日志等级 1:普通 2：警告 3：严重
	Module          env.State `gorm:"module" json:"module"`                       // 模块
	Action          byte      `gorm:"action" json:"action"`                       // 行为：1:create，2:update，3:delete，4:select，5:other
	Title           string    `gorm:"title" json:"title"`                         // 标题
	Description     string    `gorm:"description" json:"description"`             // 描述
	ActionAdminId   int32     `gorm:"action_admin_id" json:"action_admin_id"`     // 管理员ID
	ActionAdminName string    `gorm:"action_admin_name" json:"action_admin_name"` // 管理员账户
	ActionUserId    int32     `gorm:"action_user_id" json:"action_user_id"`       // 被操作人ID
	ActionUserName  string    `gorm:"action_user_name" json:"action_user_name"`   // 被操作人账户
	ActionAdminIp   string    `gorm:"action_admin_ip" json:"action_admin_ip"`     // 操作者ip
	CreatedAt       time.Time `gorm:"created_at" json:"created_at"`               // 创建时间
}



func init()  {
	ModelAdminLog = &ServerAdminLogs{}
}

func (*ServerAdminLogs) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableAdminLog.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableAdminLog.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}


func (*ServerAdminLogs) NewAdminLogOption(options ...AdminLogOption) *AdminLogOptions {

	option := &AdminLogOptions{
		Level:           ADMIN_LOG_LEVEL_INFO,
		Module:          env.ADMIN_MODULE,
		Action:          ADMIN_LOG_ACTION_OTHER,
		Title:           "",
		Description:     "",
		ActionAdminId:   0,
		ActionAdminName: "",
		ActionUserId:    0,
		ActionUserName:  "",
		ActionAdminIp:   "",
		CreatedAt:       time.Now(),
	}
	for _, o := range options {
		o(option)
	}
	_, err := tableAdminLog.Data(option).Save();
	if err != nil {
		return nil
	}
	return option

}



