package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	USER_STATUS_ENABLE = byte(1)
	USER_STATUS_DISABLE= byte(2)
)

var (
	ModelUser  *ServerUser
	tableUser = g.DB().Table(new(model.User).TableName()).Safe()
)

type ServerUser struct {}

func init()  {
	ModelUser = &ServerUser{}
}

func (*ServerUser) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableUser.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableUser.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}



func (*ServerUser) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableUser.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerUser) GetById(id int32) (gdb.Record, error)  {

	result, err := tableUser.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (*ServerUser) GetByAccount(account string) (gdb.Record, error)  {

	result, err := tableUser.Where("username=?", account).One()
	if err != nil{
		return nil, err
	}
	return result, nil
}

func (*ServerUser) GetClildsById(id int32) (gdb.Result, error)  {

	result, err := tableUser.Where("find_in_set=?", id).FindAll()
	if err != nil {
		return nil, err
	}
	return result, nil
}