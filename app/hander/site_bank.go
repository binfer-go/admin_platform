package hander

import (
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/server"
	"platform/library/response"
)

type SiteBank struct {}



/**
 * @api {Get} /v1/site_bank 站内支持的银行卡列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 站点相关 Site
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": null,
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*SiteBank) Get (req *ghttp.Request)  {

	result, err := server.ModelSiteBank.Options()
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	response.Json(req, errcode.ErrCodeSuccess, "", result)

}
