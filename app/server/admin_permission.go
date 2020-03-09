package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	// 1：显示 2：隐藏
	ADMIN_PERMISSION_STATUS_SHOW 	= byte(1)
	ADMIN_PERMISSION_STATUS_HIDEN	= byte(2)

	// 1：菜单 2：路由 3：按钮
	ADMIN_PERMISSION_TYPE_MENU	   	= byte(1)
	ADMIN_PERMISSION_TYPE_ROUTE	   	= byte(2)
	ADMIN_PERMISSION_TYPE_BUTTON   	= byte(3)
)

var (
	ModelAdminPermission  *ServerAdminPermission
	tableAdminPermission = g.DB().Table(new(model.AdminPermission).TableName()).Safe()
)

type ServerAdminPermission struct {}

func init()  {
	ModelAdminPermission = &ServerAdminPermission{}
}

func (*ServerAdminPermission) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableAdminPermission.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableAdminPermission.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}


func (*ServerAdminPermission) Create(data interface{}) (interface{}, error) {

	result, err := tableAdminPermission.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServerAdminPermission) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableAdminPermission.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerAdminPermission) GetById(id int32) (gdb.Record, error)  {

	result, err := tableAdminPermission.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}



func (*ServerAdminPermission) Options (where interface{}) (gdb.Result, error)   {

	result, err := tableAdminPermission.Where(where).Order("sort asc").All()
	if err != nil {
		return nil, err
	}
	return result, nil
}


func (*ServerAdminPermission) GetByPermissionName (name string) bool {

	info, err := tableAdminPermission.Where("permission_name=?", name).One()
	if err != nil || info != nil {
		return false
	}
	return true
}

func (*ServerAdminPermission) GetPermissionListMaps(where interface{}) (gdb.Result, error) {

	result, err := tableAdminPermission.Where(where).Fields("id, parent_id, permission_code, permission_name, permission_path, request_param, type, sort, status").All()
	if err != nil {
		return nil, err
	}
	return result, nil
}


func (*ServerAdminPermission) GetByRoleId(id int32) (gdb.Record, error)  {

	result, err := tableAdminPermission.Where("role_id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}