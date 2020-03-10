package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gpage"
	"platform/app/model"
	"platform/library/response"
)

const (
	ADMIN_SITE_CONFIG_VALUE_TYPE_INTEGER 	= byte(1)
	ADMIN_SITE_CONFIG_VALUE_TYPE_STRING 	= byte(2)
	ADMIN_SITE_CONFIG_VALUE_TYPE_FLOAT 		= byte(3)

	ADMIN_SITE_CONFIG_FROM_INPUT  			= int32(1)
	ADMIN_SITE_CONFIG_FROM_BUTTON 			= int32(2)
)

var (

	ModelSiteConfigs  *ServiceSiteConfigs
	tableSiteConfigs = g.DB().Table(new(model.SiteConfigs).TableName()).Safe()
)

type ServiceSiteConfigs struct {}





func init()  {
	ModelSiteConfigs = &ServiceSiteConfigs{}
}



func (*ServiceSiteConfigs) GetPageList(where interface{}, page int, pageSize int) (gdb.Result, interface{}, error)  {

	count, err := tableSiteConfigs.Where(where).Count();
	if err != nil{
		return nil, nil, err
	}
	result, err := tableSiteConfigs.Where(where).Filter().Page(page, pageSize).All()
	if err != nil{
		return nil, nil, err
	}

	pages := response.Page(gpage.New(count, pageSize, page,""))

	return result, pages, err

}


func (*ServiceSiteConfigs) Create(data interface{}) (interface{}, error) {

	result, err := tableSiteConfigs.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServiceSiteConfigs) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableSiteConfigs.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServiceSiteConfigs) GetById(id int32) (gdb.Record, error)  {

	result, err := tableSiteConfigs.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (*ServiceSiteConfigs) GetByCode(code string) (gdb.Record, error)  {

	result, err := tableSiteConfigs.Where("option_code=?", code).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}



func (*ServiceSiteConfigs) Get (where interface{}, fields string, groups string, orders string) (gdb.Result, error) {

	result, err := tableSiteConfigs.Where(where).Fields(fields).Order(orders).Group(groups).All()
	if err != nil {
		return nil, err
	}
	return result, nil

}





func (*ServiceSiteConfigs) Querys(sql string) error {

	_, err := g.DB().Query(sql)
	if err != nil {
		return err
	}
	return nil
}