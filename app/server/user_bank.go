package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	USER_BANK_STATUS_ENABLE = byte(1)
	USER_BANK_STATUS_DISABLE= byte(2)
)

var (
	ModelUserBank  *ServerUserBank
	tableUserBank = g.DB().Table(new(model.UserBank).TableName()).Safe()
)

type ServerUserBank struct {}

func init()  {
	ModelUserBank = &ServerUserBank{}
}

func (*ServerUserBank) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableUserBank.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableUserBank.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}



func (*ServerUserBank) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableUserBank.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerUserBank) GetById(id int32) (gdb.Record, error)  {

	result, err := tableUserBank.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}
