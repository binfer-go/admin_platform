package report

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)



var (

	ModelReportUser  *ServerReportUser
	tableReportUser = g.DB(DB_NAME_REPORT).Table(new(model.ReportUsers).TableName()).Safe(true)
)

type ServerReportUser struct {}


func init()  {
	ModelReportUser = &ServerReportUser{}
}



func (*ServerReportUser) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableReportUser.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableReportUser.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}


func (*ServerReportUser) Create(data interface{}) (interface{}, error) {

	result, err := tableReportUser.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}



func (*ServerReportUser) Get (where interface{}, fields string, groups string, orders string) (gdb.Result, error) {

	result, err := tableReportUser.Where(where).Fields(fields).Order(orders).Group(groups).All()
	if err != nil {
		return nil, err
	}
	return result, nil

}

func (*ServerReportUser) GetLeftUser (where interface{}, fields string) (*gdb.Result, error) {

	result, err := tableReportUser.As("r").Where(where).LeftJoin("platform.user as u", "u.id=r.user_id").Fields(fields).All()
	if err != nil {
		return nil, err
	}
	return &result, nil
}

func (*ServerReportUser) Count() (int, error) {

	return tableReportUser.Count()

}
