package server

import (
	"fmt"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	PUBLISH_STATUS_WAIT  		= byte(1)	// 待发布
	PUBLISH_STATUS_INSPECTION 	= byte(2)	// 待审核
	PUBLISH_STATUS_PASS 		= byte(3)	// 已通过
	PUBLISH_STATUS_REFUSE 		= byte(4)	// 已拒绝
	PUBLISH_STATUS_CLOSE 		= byte(5)	// 已关闭
	PUBLISH_STATUS_DELETE 		= byte(6)	// 已删除
)

var (
	ModelTaskPublish *ServiceTaskPublish
	tablePublish = g.DB().Table(new(model.TaskPublish).TableName()).Safe()
)

type ServiceTaskPublish struct {}

func init()  {
	ModelTaskPublish = &ServiceTaskPublish{}
}

func (*ServiceTaskPublish) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tablePublish.Where(where).Fields("id").Count();
	fmt.Println(count)
	if err != nil{
		return nil, nil, err
	}
	result, err := tablePublish.Where(where).Filter().Order("id desc").Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}
	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}



func (*ServiceTaskPublish) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tablePublish.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServiceTaskPublish) GetById(id int32) (gdb.Record, error)  {

	result, err := tablePublish.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (*ServiceTaskPublish) GetCount (where interface{}) int {
	rows, err := tablePublish.Where(where).Count()
	if err != nil {
		return int(0)
	}
	return rows
}

func (*ServiceTaskPublish) DistinctCounts (where interface{}, fields string) int {

	rows, err := tablePublish.Where(where).Fields(fields).Count()
	if err != nil {
		return int(0)
	}
	return rows

}

func (*ServiceTaskPublish) GetSum (where interface{}, field string)  int  {

	if field == "" {
		field = "SUM(count) as sums"
	}
	result, err := tablePublish.Where(where).Fields(field).One()
	if err != nil {
		return  0
	}
	type tempSums struct{
		Sums int `json:"sums"`
	}
	var tempSum tempSums
	_ = result.Struct(&tempSum)
	return tempSum.Sums

}



func (*ServiceTaskPublish) Get (where interface{}, fields string, groups string, orders string) (gdb.Result, error) {

	result, err := tablePublish.Where(where).Fields(fields).Order(orders).Group(groups).All()
	if err != nil {
		return nil, err
	}
	return result, nil

}
