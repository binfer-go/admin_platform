package config

import (
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/server"
	"platform/library/response"
	"time"
)

type SiteConfigsType struct {}

type postAddConfitTypeReq struct {
	Id int32 `json:"id"`
	Name string `json:"name"`
	Status byte `json:"status"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type postEditConfitTypeReq struct {
	Id int32 `json:"id"`
	Name string `json:"name"`
	Status byte `json:"status"`
	UpdatedAt time.Time `json:"updated_at"`
}


/**
 * @api {get} /v1/site_configs_type  配置类型选项
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 配置类型 ConfigType
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1000000006,
		"remark": {
		Id        int32     `plat:"primary_key;id" json:"id"`
		Name      string    `plat:"name" json:"name"`             // 类型名称
		Status    byte      `plat:"status" json:"status"`         // 1: 启用 2：禁用
		CreatedAt time.Time `plat:"created_at" json:"created_at"` // 创建时间
		UpdatedAt time.Time `plat:"updated_at" json:"updated_at"` // 更新时间
		},
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*SiteConfigsType) Get (req *ghttp.Request)  {

	options, err := server.ModelSiteConfigsType.Options("")
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	response.Json(req, errcode.ErrCodeSuccess, "", options)
}


/**
 * @api {post} /v1/site_configs_type  添加配置类型
 * @apiVersion 0.1.0
 * @apiName  添加
 * @apiGroup 配置类型 ConfigType
 * @apiParam {Integer} id 		    	* 类型id
 * @apiParam {String}  name 			* 类型名称 { > 2个字符}
 * @apiParam {Integer} status			* 状态 	{ 1：启用 2：禁用 } {config: site_config_type}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1000000006,
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*SiteConfigsType) Post (req *ghttp.Request)  {

	var add postAddConfitTypeReq
	if err := req.Parse(&add); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if len(add.Name) < 2 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if add.Status <= 0 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	add.CreatedAt = time.Now()
	add.UpdatedAt = time.Now()
	createStatus, err := server.ModelSiteConfigsType.Create(add)
	if err != nil || createStatus == nil {
		response.Json(req, errcode.ErrCodeFailure, "", )
	} else {
		response.Json(req, errcode.ErrCodeSuccess, "", )
	}

}

/**
 * @api {post} /v1/site_configs_type  修改配置类型
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 配置类型 ConfigType
 * @apiParam {Integer} id 		    	* 类型id
 * @apiParam {String}  name 			* 类型名称 { > 2个字符}
 * @apiParam {Integer} status			* 状态 	{ 1：启用 2：禁用 } {config: site_config_type}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1000000006,
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*SiteConfigsType) Put (req *ghttp.Request)  {

	var edit postEditConfitTypeReq
	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if len(edit.Name) < 2 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if edit.Status <= 0 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	types, err := server.ModelSiteConfigsType.GetById(edit.Id)
	if err != nil || types != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	edit.UpdatedAt = time.Now()
	createStatus, err := server.ModelSiteConfigsType.Update(edit.Id, edit)
	if err != nil || createStatus == nil {
		response.Json(req, errcode.ErrCodeFailure, "", )
	} else {
		response.Json(req, errcode.ErrCodeSuccess, "", )
	}

}

