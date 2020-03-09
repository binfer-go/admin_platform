package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	ADMIN_ROLE_STATUS_ENABLE = byte(1)
	ADMIN_ROLE_STATUS_DISABLE= byte(2)
)

var (
	ModelAdminRole  *ServerAdminRole
	tableAdminRole = g.DB().Table(new(model.AdminRole).TableName()).Safe()
)

type ServerAdminRole struct {}

func init()  {
	ModelAdminRole = &ServerAdminRole{}
}

func (*ServerAdminRole) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableAdminRole.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableAdminRole.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}


func (*ServerAdminRole) Create(data interface{}) (interface{}, error) {

	result, err := tableAdminRole.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServerAdminRole) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableAdminRole.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerAdminRole) GetById(id int32) (gdb.Record, error)  {

	result, err := tableAdminRole.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}


func (*ServerAdminRole) GetByRoleName(roleName string) (gdb.Record, error)  {

	result, err := tableAdminRole.Where("role_name=?", roleName).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}


func (*ServerAdminRole) CheckAdminRole(id int32) bool  {

	result, err := tableAdminRole.Where("id=? and status=?", id, ADMIN_ROLE_STATUS_ENABLE).One()
	if err != nil || result == nil {
		return false
	}
	return true
}

func (*ServerAdminRole) Options (where interface{}) (gdb.Result, error)   {
	result, err := tableAdminRole.Where(where).Where("status=?", ADMIN_ROLE_STATUS_ENABLE).All()
	if err != nil {
		return nil, err
	}
	return result, nil
}