package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (

	USER_STATUS_ACTION_STEP_0  	= 1									// 正常
	USER_STATUS_ACTION_STEP_1   = 60 * 60							// 1小时
	USER_STATUS_ACTION_STEP_2   = USER_STATUS_ACTION_STEP_1 * 6		// 6小时
	USER_STATUS_ACTION_STEP_3 	= USER_STATUS_ACTION_STEP_1 * 24	// 1天
	USER_STATUS_ACTION_STEP_4  	= USER_STATUS_ACTION_STEP_3 * 3		// 3天
	USER_STATUS_ACTION_STEP_5  	= USER_STATUS_ACTION_STEP_3 * 30	// 1个月
)

var (
	ModelUserAction  *ServerUserAction
	tableUserAction = g.DB().Table(new(model.UserActionStatus).TableName()).Safe()
)

type ServerUserAction struct {}

func init()  {
	ModelUserAction = &ServerUserAction{}
}

func (*ServerUserAction) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableUserAction.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableUserAction.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}

func (*ServerUserAction) Create(data interface{}) (interface{}, error) {

	result, err := tableUserAction.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}



func (*ServerUserAction) Get (where interface{}, fields string, groups string, orders string) (gdb.Result, error) {

	result, err := tableUserAction.Where(where).Fields(fields).Order(orders).Group(groups).All()
	if err != nil {
		return nil, err
	}
	return result, nil

}


