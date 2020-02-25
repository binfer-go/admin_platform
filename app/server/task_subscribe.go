package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	SUBSCRIBE_STATUS_WAIT  		= byte(1)	// 进行中
	SUBSCRIBE_STATUS_PASS 		= byte(2)	// 已提交
	SUBSCRIBE_STATUS_REFUSE 	= byte(3)	// 已拒绝
	SUBSCRIBE_STATUS_REWAIT 	= byte(4)	// 重新提交
	SUBSCRIBE_STATUS_OK 		= byte(5)	// 已结算

)

var (
	ModelTaskSubscribe *ServiceTaskSubscribe
	tableSubscribe = g.DB().Table(new(model.TaskSubscribe).TableName()).Safe()
)

type ServiceTaskSubscribe struct {}

func init()  {
	ModelTaskSubscribe = &ServiceTaskSubscribe{}
}

func (*ServiceTaskSubscribe) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableSubscribe.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableSubscribe.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}
	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}



func (*ServiceTaskSubscribe) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableSubscribe.Data(data).Where("id=?", id).Update()

	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServiceTaskSubscribe) GetById(id int32) (gdb.Record, error)  {

	result, err := tableSubscribe.Where("id=?", id).One()

	if err != nil {
		return nil, err
	}
	return result, nil
}
