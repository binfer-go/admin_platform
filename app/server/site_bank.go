package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	SITE_BANK_STATUS_ENABLE = byte(1)
	SITE_BANK_STATUS_DISABLE= byte(2)
)

var (
	ModelSiteBank  *ServerSiteBanks
	tableSiteBank = g.DB().Table(new(model.SiteBank).TableName()).Safe()
)

type ServerSiteBanks struct {}

func init()  {
	ModelSiteBank = &ServerSiteBanks{}
}

func (*ServerSiteBanks) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableSiteBank.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableSiteBank.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}



func (*ServerSiteBanks) Create (slice interface{}) (interface{}, error) {

	result, err :=  tableSiteBank.Data(slice).Insert()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServerSiteBanks) Options () (gdb.Result, error) {

	result, err := tableSiteBank.Where("status=?", 1).All();
	if err != nil {
		return nil, err
	}
	return result, err
}