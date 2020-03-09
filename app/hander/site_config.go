package hander

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/server"
	"platform/library/redis"
	"platform/library/response"
)

type Configs struct {}



/**
 * @api {Get} /v1/site_config *** 配置信息
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
			"admin_status": [
            {
                "name": "启用",
                "value": 1
            },
            {
                "name": "禁用",
                "value": 2
            }
        ],
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
func (*Configs) Get (req *ghttp.Request)  {



	var config = g.Map{

		"task_status" : 	[]g.Map{
			{
				"name":  "启用",
				"value": server.ADMIN_TASK_STATUS_ENABLE,
			},
			{
				"name":  "禁用",
				"value": server.ADMIN_TASK_STATUS_DISABLE,
			},
		},
		"task_publish_status" : 	[]g.Map{
			{
				"name":"待发布",
				"value":server.PUBLISH_STATUS_WAIT,
			},
			{
				"name":"待审核",
				"value":server.PUBLISH_STATUS_INSPECTION,
			},
			{
				"name":"已通过",
				"value":server.PUBLISH_STATUS_PASS,
			},
			{
				"name":"已拒绝",
				"value":server.PUBLISH_STATUS_REFUSE,
			},
			{
				"name":"已关闭",
				"value":server.PUBLISH_STATUS_CLOSE,
			},
			{
				"name":"已删除",
				"value":server.PUBLISH_STATUS_DELETE,
			},
		},

		"task_subscribe_status" : 	[]g.Map{
			{
				"name":"待提交",
				"value":server.SUBSCRIBE_STATUS_WAIT,
			},
			{
				"name":"待审核",
				"value":server.SUBSCRIBE_STATUS_INSPECTION,
			},
			{
				"name":"已通过",
				"value":server.SUBSCRIBE_STATUS_PASS,
			},
			{
				"name":"已拒绝",
				"value":server.SUBSCRIBE_STATUS_REFUSE,
			},
			{
				"name":"待复审",
				"value":server.SUBSCRIBE_STATUS_REWAIT,
			},
			{
				"name":"复审失败",
				"value":server.SUBSCRIBE_STATUS_REWAIT_FAILURE,
			},
			{
				"name":"已过期",
				"value":server.SUBSCRIBE_STATUS_OVERDUE,
			},
		},
		"admin_status" : []g.Map{
			{
				"name":"启用",
				"value":server.ADMIN_STATUS_ENABLE,
			},
			{
				"name":"禁用",
				"value":server.ADMIN_STATUS_DISABLE,
			},
		},
		"admin_role_status" : []g.Map{
			{
				"name":"启用",
				"value":server.ADMIN_ROLE_STATUS_ENABLE,
			},
			{
				"name":"禁用",
				"value":server.ADMIN_ROLE_STATUS_DISABLE,
			},
		},
		"site_admin_log_model" : env.ModuleConfigs(),

		"site_admin_log_action" : []g.Map{
			{
				"name" : "创建",
				"value": server.ADMIN_LOG_ACTION_CREATE,
			},
			{
				"name" : "修改",
				"value": server.ADMIN_LOG_ACTION_UPDATE,
			},
			{
				"name" : "删除",
				"value": server.ADMIN_LOG_ACTION_DELETE,
			},
			{
				"name" : "查询",
				"value": server.ADMIN_LOG_ACTION_SELECT,
			},
			{
				"name" : "其他",
				"value": server.ADMIN_LOG_ACTION_OTHER,
			},
		},
		"site_admin_log_level" : []g.Map{
			{
				"name" : "普通",
				"value": server.ADMIN_LOG_LEVEL_INFO,
			},
			{
				"name" : "提醒",
				"value": server.ADMIN_LOG_LEVEL_WARNING,
			},
			{
				"name" : "警告",
				"value": server.ADMIN_LOG_LEVEL_ERROR,
			},
		},
		"bill_operate": []g.Map{
			{
				"name" : "存款",
				"value": server.ADMIN_BILL_OPERATE_STATUS_DEPOSIT,
			},
			{
				"name" : "取款",
				"value": server.ADMIN_BILL_OPERATE_STATUS_WITHDRAW,
			},
			{
				"name" : "发布任务",
				"value": server.ADMIN_BILL_OPERATE_STATUS_TASK_PUBLISH,
			},
			{
				"name" : "佣金",
				"value": server.ADMIN_BILL_OPERATE_STATUS_TASK_COMMISSION,
			},
			{
				"name" : "退还",
				"value": server.ADMIN_BILL_OPERATE_STATUS_TASK_FINISH,
			},
			{
				"name" : "提取佣金",
				"value": server.ADMIN_BILL_OPERATE_STATUS_TASK_SUBSCRIBE_DEL,
			},
		},
		"bill_role": []g.Map{
			{
				"name" : "系统处理",
				"value": server.ADMIN_BILL_ROLE_SYSTEM,
			},
			{
				"name" : "人工处理",
				"value": server.ADMIN_BILL_ROLE_MANUAL,
			},
		},
		"bill_type": []g.Map{
			{
				"name" : "加款",
				"value": server.ADMIN_BILL_TYPE_GOLD_ADD,
			},
			{
				"name" : "扣款",
				"value": server.ADMIN_BILL_TYPE_GOLD_DEL,
			},
		},
		"user_status" : []g.Map{
			{
				"name" : "正常",
				"value": server.USER_STATUS_ENABLE,
			},
			{
				"name" : "异常",
				"value": server.USER_STATUS_DISABLE,
			},
		},
		"user_wallet_type" : []g.Map{
			{
				"name" : "主钱包",
				"value": server.USER_STATUS_ENABLE,
			},
			{
				"name" : "佣金",
				"value": server.USER_STATUS_DISABLE,
			},
		},
		"user_bank_status" : []g.Map{
			{
				"name" : "启用",
				"value": server.USER_BANK_STATUS_ENABLE,
			},
			{
				"name" : "禁用",
				"value": server.USER_BANK_STATUS_DISABLE,
			},
		},
		"user_deposit_status" : []g.Map{
			{
				"name" : "进行中",
				"value": server.USER_DEPOSIT_STATUS_WAIT,
			},
			{
				"name" : "待审核",
				"value": server.USER_DEPOSIT_STATUS_INSPECTION,
			},
			{
				"name" : "成功",
				"value": server.USER_DEPOSIT_STATUS_SUCCESS,
			},
			{
				"name" : "失败",
				"value": server.USER_DEPOSIT_STATUS_FAILURE,
			},
		},
		"user_withdraw_status" : []g.Map{
			{
				"name" : "进行中",
				"value": server.USER_WITHDRAW_STATUS_WAIT,
			},
			{
				"name" : "待审核",
				"value": server.USER_WITHDRAW_STATUS_INSPECTION,
			},
			{
				"name" : "成功",
				"value": server.USER_WITHDRAW_STATUS_SUCCESS,
			},
			{
				"name" : "失败",
				"value": server.USER_WITHDRAW_STATUS_FAILURE,
			},
		},
		"user_action_status" : []g.Map{
			{
				"name" : "正常",
				"value": server.USER_STATUS_ACTION_STEP_0,
			},
			{
				"name" : "1小时",
				"value": server.USER_STATUS_ACTION_STEP_1,
			},
			{
				"name" : "6小时",
				"value": server.USER_STATUS_ACTION_STEP_2,
			},
			{
				"name" : "1天",
				"value": server.USER_STATUS_ACTION_STEP_3,
			},
			{
				"name" : "3天",
				"value": server.USER_STATUS_ACTION_STEP_4,
			},
			{
				"name" : "1个月",
				"value": server.USER_STATUS_ACTION_STEP_5,
			},
		},
	}
	response.Json(req, errcode.ErrCodeSuccess, "", config)

}



func BuilderSiteConfigRedis ()  {

	g.Redis().Do("HSET", redis.ADMIN_SITE_CONFIG_INIT, "site_page_max", 30)
}