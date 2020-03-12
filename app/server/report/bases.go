package report

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
	"time"
)

const DB_NAME_REPORT = "report"


var (
	DBReportName = g.Config().GetString("database.report")
	ModelReportBase  *ServerReportBase
	tableReportBase = g.DB(DB_NAME_REPORT).Table(new(model.ReportBases).TableName()).Safe(true)
)

type ServerReportBase struct {}

type ServiceReportBaseOption func(base *model.ReportBases)



func init()  {
	ModelReportBase = &ServerReportBase{}
}



func (*ServerReportBase) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableReportBase.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableReportBase.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}


func (*ServerReportBase) Create(data interface{}) (interface{}, error) {

	result, err := tableReportBase.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}


func (*ServerReportBase) Update(where interface{}, data interface{}) (interface{}, error) {

	result, err := tableReportBase.Where(where).Data(data).Update();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServerReportBase) Get (where interface{}, fields string, groups string, orders string) (gdb.Result, error) {

	result, err := tableReportBase.Where(where).Fields(fields).Order(orders).Group(groups).All()
	if err != nil {
		return nil, err
	}
	return result, nil

}

func (*ServerReportBase) NewOptions (opts ...ServiceReportBaseOption) *model.ReportBases {
	opt := &model.ReportBases{
		Id:                              0,
		Date:                            time.Time{},
		UserId:                          0,
		UserParentId:                    0,
		UserPhone:                       "",
		UserBalance:                     0,
		UserCommission:                  0,
		TaskPublishCount:                0,
		TaskPublishMoneySum:             0,
		TaskPublishAcceptCount:          0,
		TaskPublishSuccessAcceptCount:   0,
		TaskPublishEndCount:             0,
		TaskPublishSuccessCount:         0,
		TaskPublishChildrenCount:        0,
		TaskPublishChildrenFailureCount: 0,
		TaskPublishChildrenSuccessCount: 0,
		TaskPublishChildrenWaitCount:    0,
		TaskSubscribeCount:              0,
		TaskSubscribeMoneySum:           0,
		TaskSubscribeStatusSuccessCount: 0,
		TaskSubscribeStatusFailureCount: 0,
		TaskSubscribeStatusWaitCount:    0,
		UserDepositCount:                0,
		UserDepositMoneySum:             0,
		UserDepositMoneyMax:             0,
		UserDepositManualMoneySum:       0,
		UserDepositManualMoneyCount:     0,
		UserDepositManualMoneyMax:       0,
		UserWithdrawCount:               0,
		UserWithdrawMoneySum:            0,
		UserWithdrawMoneyMax:            0,
		UserWithdrawManualMoneySum:      0,
		UserWithdrawManualMoneyCount:    0,
		UserWithdrawManualMoneyMax:      0,
		CreatedAt:                       time.Time{},
		UpdatedAt:                       time.Now(),
	}
	for _, o := range opts {
		o(opt)
	}
	return opt
}


func (*ServerReportBase) Querys(sql string) error {

	_, err := g.DB(DB_NAME_REPORT).Exec(sql)
	if err != nil {
		return err
	}
	return nil
}