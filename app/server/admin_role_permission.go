package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"platform/app/model"
)

const (
	ADMIN_ROLE_PERMISSION_STATUS_ENABLE = byte(1)
	ADMIN_ROLE_PERMISSION_DISABLE		= byte(2)
)

var (
	ModelAdminRolePermission  *ServerAdminRolePermission
	tableAdminRolePermission = g.DB().Table(new(model.AdminRolePermission).TableName()).Safe()
)

type ServerAdminRolePermission struct {}

func init()  {
	ModelAdminRolePermission = &ServerAdminRolePermission{}
}



func (*ServerAdminRolePermission) Create(data interface{}) (interface{}, error) {

	result, err := tableAdminRolePermission.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServerAdminRolePermission) Update(role_id int32, data interface{}) (interface{}, error)  {

	result, err := tableAdminRolePermission.Data(data).Where("role_id=?", role_id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}



func (*ServerAdminRolePermission) GetByRoleId(id int32) (gdb.Record, error)  {

	result, err := tableAdminRolePermission.Where("role_id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}


