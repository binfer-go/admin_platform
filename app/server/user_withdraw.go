package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	USER_WITHDRAW_STATUS_WAIT 			= byte(1)
	USER_WITHDRAW_STATUS_INSPECTION 	= byte(2)
	USER_WITHDRAW_STATUS_SUCCESS		= byte(3)
	USER_WITHDRAW_STATUS_FAILURE		= byte(4)

)

var (
	ModelUserWithdraw  *ServerUserWithdraw
	tableUserWithdraw = g.DB().Table(new(model.UserWithdraw).TableName()).Safe()
)

type ServerUserWithdraw struct {}

func init()  {
	ModelUserWithdraw = &ServerUserWithdraw{}
}

func (*ServerUserWithdraw) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableUserWithdraw.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableUserWithdraw.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}



func (*ServerUserWithdraw) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableUserWithdraw.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerUserWithdraw) GetById(id int32) (gdb.Record, error)  {

	result, err := tableUserWithdraw.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}
