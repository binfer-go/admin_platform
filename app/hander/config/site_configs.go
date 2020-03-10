package config

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander"
	"platform/app/hander/env"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
	"platform/library/redis"
	"platform/library/response"
	"time"
)

type SiteConfigs struct {}

type getListSiteConfigReq struct {
	Id int32 `json:"id"`
	OptionName string `json:"option_name"`
	OptionCode string `json:"option_code"`
	TypeId int32 `json:"type_id"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

type getAddSiteConfigReq struct {
	OptionName string `json:"option_name"`
	OptionCode string `json:"option_code"`
	OptionDescribe string `json:"option_describe"`
	TypeId int32 `json:"type_id"`
	FromId int32 `json:"from_id"`
	Units string `json:"units"`
	ValueType byte `json:"value_type"`
	Value string `json:"value"`
	CreatedAt     time.Time `plat:"created_at" json:"created_at"`
	UpdatedAt     time.Time `plat:"updated_at" json:"updated_at"`
}
type getEditSiteConfigReq struct {
	Id int32 `json:"id"`
	OptionName string `json:"option_name"`
	OptionCode string `json:"option_code"`
	OptionDescribe string `json:"option_describe"`
	TypeId int32 `json:"type_id"`
	FromId int32 `json:"from_id"`
	ValueType byte `json:"value_type"`
	Value string `json:"value"`
	Units string `json:"units"`
	UpdatedAt     time.Time `plat:"updated_at" json:"updated_at"`
}

type getOptionReq struct {
	TypeId int32 `json:"type_id"`
}

type patchConfigReq struct {
	TypeId int32 `json:"type_id"`
	Options string `json:"options"`
}

/**
 * @api {get} /v1/site_configs  配置列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 配置 Configs
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			单条信息详情
 * @apiParam {String}  option_code   code
 * @apiParam {String}  option_name   配置名
 * @apiParam {Integer} type_id   	 配置类型选项查询 {api : get /v1/site_configs_type}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1000000006,
		"remark": {
		Id              int32     `plat:"primary_key;id" json:"id"`
		OptionName      string    `plat:"option_name" json:"option_name"`             // 选项名称
		OptionCode      string    `plat:"option_code" json:"option_code"`             // 选项code
		OptionDescribe  string    `plat:"option_describe" json:"option_describe"`     // 选项描述
		TypeId          int32     `plat:"type_id" json:"type_id"`                     // 配置类型
		FromId          int32     `plat:"from_id" json:"from_id"`                     // 表单类型 {config: site_configs_from_type}
		BussinessTypeId int32     `plat:"bussiness_type_id" json:"bussiness_type_id"` // 业务类型
		Units           string    `plat:"units" json:"units"`                         // 单位
		ValueType       int32     `plat:"value_type" json:"value_type"`               // 值类型  {config : site_configs_value_type}
		Value           string    `plat:"value" json:"value"`                         // 值
		CreatedAt       time.Time `plat:"created_at" json:"created_at"`               // 创建时间
		UpdatedAt       time.Time `plat:"updated_at" json:"updated_at"`               // 更新时间
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
func (*SiteConfigs) Get (req *ghttp.Request)  {

	var list getListSiteConfigReq

	where := g.Map{}
	if err := req.Parse(&list); err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if list.Id > 0 {
		where["id"]= list.Id
	}
	if list.OptionCode != "" {
		where["option_code"] = list.OptionCode
	}
	if list.OptionName != "" {
		where["option_name"] = list.OptionName
	}
	if list.TypeId != 0 {
		where["type_id"] = list.TypeId
	}
	result, pages, _ := server.ModelSiteConfigs.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)
}



/**
 * @api {post} /v1/site_configs  添加配置
 * @apiVersion 0.1.0
 * @apiName  添加
 * @apiGroup 配置 Configs
 * @apiParam {String}  option_name 		* 配置名称	{ > 2个字符}
 * @apiParam {String}  option_code 		* 配置code	{ > 2个字符}
 * @apiParam {String}  option_describe 	* 描述
 * @apiParam {Integer} type_id			* 配置类型选项查询 {api : get /v1/site_configs_type}
 * @apiParam {Integer} from_id			* 表单类型 {config: site_configs_from_type}
 * @apiParam {String}  units			* 单位 {元 份 %}
 * @apiParam {Integer} value_type		* 类型 { config : site_configs_value_type }
 * @apiParam {String}  value	    	* 值
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
func (*SiteConfigs) Post (req *ghttp.Request)  {

	var add getAddSiteConfigReq
	if err := req.Parse(&add); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if len(add.OptionName) < 2 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if len(add.OptionCode) < 2 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if add.TypeId <= 0 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	info, err := server.ModelSiteConfigs.GetByCode(add.OptionCode)
	if err != nil || info != nil {
		response.Json(req, errcode.ErrCodeConfigCodeExist, "")
	}
	add.CreatedAt = time.Now()
	add.UpdatedAt = time.Now()
	createStatus, err := server.ModelSiteConfigs.Create(add)
	if err != nil || createStatus == nil {
		response.Json(req, errcode.ErrCodeFailure, "", )
	} else {
		_, _ = g.Redis().Do("HSET", redis.ADMIN_HASH_SITE_CONFIG_BUSINESS, add.OptionCode, add.Value)
		log, _ := json.Marshal(&add)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Level = server.ADMIN_LOG_LEVEL_INFO
			options.Action= server.ADMIN_LOG_ACTION_CREATE
			options.Module= env.ADMIN_MODULE_SITE
			options.Title = env.F[env.ADMIN_MODULE_SITE]
			options.Description = string(log)
			options.ActionAdminId = hander.Admins.Id
			options.ActionAdminName = hander.Admins.Account
			options.ActionAdminIp = req.GetClientIp()
		})
		response.Json(req, errcode.ErrCodeSuccess, "", )
	}

}

/**
 * @api {put} /v1/site_configs  更新配置
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 配置 Configs
 * @apiParam {Integer} id 		    	* 类型id
 * @apiParam {String}  option_name 		* 配置名称	{ > 2个字符}
 * @apiParam {String}  option_code 		* 配置code	{ > 2个字符}
 * @apiParam {String}  option_describe 	* 描述
 * @apiParam {Integer} type_id			* 配置类型选项查询 {api : get /v1/site_configs_type}
 * @apiParam {Integer} from_id			* 表单类型 {config: site_configs_from_type}
 * @apiParam {String}  units			* 单位 {元 份 %}
 * @apiParam {Integer} value_type		* 类型 { config : site_configs_value_type }
 * @apiParam {String} value				* 值
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
func (*SiteConfigs) Put (req *ghttp.Request)  {

	var edit getEditSiteConfigReq
	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if len(edit.OptionCode) < 2 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if len(edit.OptionCode) < 2 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if edit.TypeId <= 0 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	config, err := server.ModelSiteConfigs.GetById(edit.Id)
	if err != nil || config == nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	edit.UpdatedAt = time.Now()
	createStatus, err := server.ModelSiteConfigs.Update(edit.Id, edit)
	if err != nil || createStatus == nil {
		response.Json(req, errcode.ErrCodeFailure, "", )
	} else {
		_, _ = g.Redis().Do("HSET", redis.ADMIN_HASH_SITE_CONFIG_BUSINESS, edit.OptionCode, edit.Value)
		log, _ := json.Marshal(&edit)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Level = server.ADMIN_LOG_LEVEL_INFO
			options.Action= server.ADMIN_LOG_ACTION_UPDATE
			options.Module= env.ADMIN_MODULE_SITE
			options.Title = env.F[env.ADMIN_MODULE_SITE]
			options.Description = string(log)
			options.ActionAdminId = hander.Admins.Id
			options.ActionAdminName = hander.Admins.Account
			options.ActionAdminIp = req.GetClientIp()
		})
		response.Json(req, errcode.ErrCodeSuccess, "", edit)
	}

}

/**
 * @api {patch} /v1/site_configs  更新(遍历)配置参数
 * @apiVersion 0.1.0
 * @apiName  配置参数
 * @apiGroup 配置 Configs
 * @apiParam {Integer} type_id 		    * 类型id
 * @apiParam {String}  options 			* 配置项参数json	[{"id": 1,"option_code":"task_money_min","value": 1110},{"id": 2,"option_code":"task_count_min","value":112}]
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
func (*SiteConfigs) Patch (req *ghttp.Request) {
	var patch patchConfigReq

	if err := req.Parse(&patch); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if len(patch.Options) <= 0 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	types, err := server.ModelSiteConfigsType.GetById(patch.TypeId)
	if err != nil || types == nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	var temp g.List
	err = json.Unmarshal([]byte(patch.Options), &temp)
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, err.Error())
	}
	columns := g.Array{
		"id",
		"option_code",
		"value",
	}
    sql := help.Sql(new(model.SiteConfigs).TableName(), columns, temp, "id", "")
    sql = sql + fmt.Sprintf(" and type_id=%v", patch.TypeId)
	err = server.ModelSiteConfigs.Querys(sql)
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, err.Error())
	} else {
		for _, v := range temp {
			if code, ok := v["option_code"]; ok == true {
				_, _ = g.Redis().Do("HSET", redis.ADMIN_HASH_SITE_CONFIG_BUSINESS, code, v["value"])
			}
		}
		log, _ := json.Marshal(&patch)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Level = server.ADMIN_LOG_LEVEL_INFO
			options.Action= server.ADMIN_LOG_ACTION_UPDATE
			options.Module= env.ADMIN_MODULE_SITE
			options.Title = env.F[env.ADMIN_MODULE_SITE]
			options.Description = string(log)
			options.ActionAdminId = hander.Admins.Id
			options.ActionAdminName = hander.Admins.Account
			options.ActionAdminIp = req.GetClientIp()
		})
		response.Json(req, errcode.ErrCodeSuccess, "")
	}

}

/**
 * @api {get} /v1/site_type_config  配置下属列表(遍历)
 * @apiVersion 0.1.0
 * @apiName  遍历列表
 * @apiGroup 配置 Configs
 * @apiParam {Integer} type_id		* 配置类型id
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
func (*SiteConfigs) Option (req *ghttp.Request) {

	var option getOptionReq

	if err := req.Parse(&option); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	types, err := server.ModelSiteConfigsType.GetById(option.TypeId)
	if err != nil || types == nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	configs, err := server.ModelSiteConfigs.Get(g.Map{"type_id":option.TypeId}, "*","", "")
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	response.Json(req, errcode.ErrCodeSuccess, "", configs)

}
