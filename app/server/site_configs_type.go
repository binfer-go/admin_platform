package server

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/frame/g"
	"platform/app/model"
)

const (
	ADMIN_SITE_CONFIG_TYPE_STATUS_ENABLE 	= byte(1)
	ADMIN_SITE_CONFIG_TYPE_STATUS_DISABLE 	= byte(2)
)

var (

	ModelSiteConfigsType  *ServiceSiteConfigsType
	tableSiteConfigsType = g.DB().Table(new(model.SiteConfigsType).TableName()).Safe()
)

type ServiceSiteConfigsType struct {}



func init()  {
	ModelSiteConfigsType = &ServiceSiteConfigsType{}
}



func (*ServiceSiteConfigsType) Create(data interface{}) (interface{}, error) {

	result, err := tableSiteConfigsType.Data(data).Save();
	if err != nil {
		return nil, err
	}
	lastId, _ := result.LastInsertId()
	return lastId, nil
}

func (*ServiceSiteConfigsType) Update(id int32, data interface{}) (interface{}, error)  {

	result, err := tableSiteConfigsType.Data(data).Where("id=?", id).Update()
	if err != nil {
		return nil, err
	}
	rowsNum, _ := result.RowsAffected()
	return rowsNum, nil
}

func (*ServiceSiteConfigsType) GetById(id int32) (gdb.Record, error)  {

	result, err := tableSiteConfigsType.Where("id=?", id).One()
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (*ServiceSiteConfigsType) Options (where interface{}) (gdb.Result, error)   {
	result, err := tableSiteConfigsType.Where(where).Where("status=?", ADMIN_SITE_CONFIG_TYPE_STATUS_ENABLE).All()
	if err != nil {
		return nil, err
	}
	return result, nil
}
