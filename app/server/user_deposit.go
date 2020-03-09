package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	USER_DEPOSIT_STATUS_WAIT 		= byte(1)
	USER_DEPOSIT_STATUS_INSPECTION 	= byte(2)
	USER_DEPOSIT_STATUS_SUCCESS		= byte(3)
	USER_DEPOSIT_STATUS_FAILURE		= byte(4)

)

var (
	ModelUserDeposit  *ServerUserDeposit
	tableUserDeposit = g.DB().Table(new(model.UserDeposit).TableName()).Safe()
)

type ServerUserDeposit struct {}

func init()  {
	ModelUserDeposit = &ServerUserDeposit{}
}

func (*ServerUserDeposit) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableUserDeposit.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableUserDeposit.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}



func (*ServerUserDeposit) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableUserDeposit.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerUserDeposit) GetById(id int32) (gdb.Record, error)  {

	result, err := tableUserDeposit.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}
