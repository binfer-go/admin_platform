package hander

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/server"
	"platform/library/redis"
	"platform/library/response"
)

type Configs struct {}



/**
 * @api {Options} /v1/config 配置信息
 * @apiVersion 0.1.0
 * @apiName  配置
 * @apiGroup 站点相关 Site
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": {
			"task_publish_status": [
				"待发布",
				"待审核",
				"已通过",
				"已拒绝",
				"已关闭",
				"已删除"
			]
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
func (*Configs) Options (req *ghttp.Request)  {

	var config = g.Map{

		"task_publish_status" : 	[7]interface{}{

			server.PUBLISH_STATUS_WAIT : 		"待发布",
	 		server.PUBLISH_STATUS_INSPECTION : 	"待审核",
	 		server.PUBLISH_STATUS_PASS : 		"已通过",
	 		server.PUBLISH_STATUS_REFUSE :		"已拒绝",
	 		server.PUBLISH_STATUS_CLOSE : 		"已关闭",
	 		server.PUBLISH_STATUS_DELETE : 		"已删除",
		},
		"task_subscribe_status" : 	[6]interface{}{

			server.SUBSCRIBE_STATUS_WAIT : 		"进行中",
			server.SUBSCRIBE_STATUS_PASS : 		"已提交",
			server.SUBSCRIBE_STATUS_REFUSE : 	"已拒绝",
			server.SUBSCRIBE_STATUS_REWAIT :	"重新提交",
			server.SUBSCRIBE_STATUS_OK : 		"已结算",
		},

		"admin_status" : [3]interface{}{
			server.ADMIN_STATUS_ENABLE : "启用",
			server.ADMIN_STATUS_DISABLE : "禁用",
		},
	}
	response.Json(req, errcode.ErrCodeSuccess, "", config)

}

func BuilderSiteConfigRedis ()  {

	g.Redis().Do("HSET", redis.ADMIN_SITE_CONFIG_INIT, "site_page_max", 30)
}