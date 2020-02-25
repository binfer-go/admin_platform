package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	ADMIN_STATUS_ENABLE = byte(1)
	ADMIN_STATUS_DISABLE= byte(2)
)

var (
	ModelAdmin  *ServerAdmin
	tableAdmin = g.DB().Table(new(model.Admin).TableName()).Safe()
)

type ServerAdmin struct {}

func init()  {
	ModelAdmin = &ServerAdmin{}
}

func (*ServerAdmin) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableAdmin.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableAdmin.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}


func (*ServerAdmin) Create(data interface{}) (interface{}, error) {

	result, err := tableAdmin.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServerAdmin) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableAdmin.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerAdmin) GetById(id int32) (gdb.Record, error)  {

	result, err := tableAdmin.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (*ServerAdmin) GetByAccount(account string) (gdb.Record, error)  {

	result, err := tableAdmin.Where("account=?", account).One()
	if err != nil{
		return nil, err
	}
	return result, nil
}
