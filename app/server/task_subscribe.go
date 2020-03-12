package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	// 1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:复审失败 7:已过期
	SUBSCRIBE_STATUS_WAIT  		= byte(1)	// 待提交
	SUBSCRIBE_STATUS_INSPECTION = byte(2)	// 待审核
	SUBSCRIBE_STATUS_PASS 		= byte(3)	// 已通过
	SUBSCRIBE_STATUS_REFUSE 	= byte(4)	// 已拒绝
	SUBSCRIBE_STATUS_REWAIT 	= byte(5)	// 待复审
	SUBSCRIBE_STATUS_OVERDUE 	= byte(6)	// 已过期
	SUBSCRIBE_STATUS_REWAIT_FAILURE = byte(7)	// 复审失败
	SUBSCRIBE_STATUS_FAILURE 	= byte(8)	// 失败

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
	result, err := tableSubscribe.Where(where).Filter().Order("id desc").Page(page, pageSize).All()
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

func (*ServiceTaskSubscribe) GetCount (where interface{}) int {
	rows, err := tableSubscribe.Where(where).Count()
	if err != nil {
		return int(0)
	}
	return rows
}


func (*ServiceTaskSubscribe) Get (where interface{}, fields string, groups string, orders string) (gdb.Result, error) {

	result, err := tableSubscribe.Where(where).Fields(fields).Order(orders).Group(groups).All()
	if err != nil {
		return nil, err
	}
	return result, nil

}


func (*ServiceTaskSubscribe) Create(data interface{}) (interface{}, error) {

	result, err := tableSubscribe.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}