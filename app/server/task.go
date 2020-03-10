package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	ADMIN_TASK_STATUS_ENABLE 	= byte(1)
	ADMIN_TASK_STATUS_DISABLE 	= byte(2)
	ADMIN_TASK_STATUS_DELETE 	= byte(3)
)
var (
	ModelTask  *ServerTask
	tableTask = g.DB().Table(new(model.Task).TableName()).Safe()
)

type ServerTask struct {}

func init()  {
	ModelTask = &ServerTask{}
}

func (*ServerTask) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableTask.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableTask.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}
	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}



func (*ServerTask) Create(data interface{}) (interface{}, error) {

	result, err := tableTask.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServerTask) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableTask.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerTask) GetById(id int32) (gdb.Record, error)  {

	result, err := tableTask.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}


func (*ServerTask) Get (where interface{}, fields string, groups string, orders string) (gdb.Result, error) {

	result, err := tableTask.Where(where).Fields(fields).Order(orders).Group(groups).All()
	if err != nil {
		return nil, err
	}
	return result, nil

}