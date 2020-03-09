package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	// 账变形式
	ADMIN_BILL_TYPE_GOLD_ADD = byte(1)	// 加钱
	ADMIN_BILL_TYPE_GOLD_DEL = byte(2)  // 扣钱
	// 账变方案
	ADMIN_BILL_ROLE_SYSTEM = byte(1)	// 系统
	ADMIN_BILL_ROLE_MANUAL = byte(2)  	// 人工
	// 账变类型
	ADMIN_BILL_OPERATE_STATUS_DEPOSIT  				= byte(1)	// 存款
	ADMIN_BILL_OPERATE_STATUS_WITHDRAW 				= byte(2)	// 取款
	ADMIN_BILL_OPERATE_STATUS_TASK_PUBLISH 			= byte(3)	// 发布任务
	ADMIN_BILL_OPERATE_STATUS_TASK_COMMISSION		= byte(4)	// 佣金
	ADMIN_BILL_OPERATE_STATUS_TASK_FINISH			= byte(5)	// 任务结束退回
	ADMIN_BILL_OPERATE_STATUS_TASK_SUBSCRIBE_DEL 	= byte(6)	// 提取佣金

)

var (

	ModelBill  *ServerBills
	tableBill = g.DB().Table(new(model.Bill).TableName()).Safe()
)

type ServerBills struct {}

func init()  {
	ModelBill = &ServerBills{}
}


func (*ServerBills) Create(data interface{}) (interface{}, error) {

	result, err := tableBill.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServerBills) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableBill.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableBill.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}

func (*ServerBills) GetSum (where interface{})  float64  {

	result, err := tableBill.Where(where).Fields("SUM(amount) as sums").One()
	if err != nil {
		return  0
	}
	type tempSums struct{
		Sums float64 `json:"sums"`
	}
	var tempSum tempSums
	_ = result.Struct(&tempSum)
	return tempSum.Sums

}

func (*ServerBills) Get (where interface{}, fields string, groups string, orders string) (gdb.Result, error) {

	result, err := tableBill.Where(where).Fields(fields).Order(orders).Group(groups).All()
	if err != nil {
		return nil, err
	}
	return result, nil

}
