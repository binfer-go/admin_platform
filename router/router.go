package router

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/hander"
	"platform/app/hander/config"
	"platform/app/hander/report"
	"platform/app/middleware"
)

const ADMIN_API_VERSION = "v1" //版本号

func init()  {

	server	:= g.Server()
	server.Use(middleware.MiddlewareCORS)

	server.Group(ADMIN_API_VERSION, func(group *ghttp.RouterGroup) {

		// 业务状态配置
		group.REST("config", 				new(hander.Configs))
		// 登陆
		group.POST("login", 				new(hander.Auth).Post)
		/* ------------- */
		group.Middleware(middleware.MiddlewareAuth, middleware.MiddlewarePage)
		// 刷新Token
		group.PUT( "refresh", 				new(hander.Auth).Put)
		// 登出
		group.REST("logout", 				new(hander.Logout))
		// 站内银行
		group.REST("site_bank",				new(hander.SiteBank))
		// 管理员日志
		group.REST("site_admin_log",		new(hander.SiteAdminLog))
		// 管理员权限关系
		group.REST("admin_role_permission",	new(hander.AdminRolePermission))
		// 管理员权限
		group.REST("admin_permission",		new(hander.AdminPermission))
		// 管理员角色
		group.REST("admin_role", 			new(hander.AdminRole))
		// 角色列表选项
		group.GET( "admin_role_options", 	new(hander.AdminRole).Option)
		// 角色权限
		group.GET( "admin_role_maps", 		new(hander.AdminRole).RoleMaps)
		// 管理员管理
		group.REST("admin", 				new(hander.Admin))
		// 会员管理
		group.REST("user", 					new(hander.User))
		// 会员行为
		group.GET( "user_info",				new(hander.User).Info)
		// 会员银行管理
		group.REST("user_bank", 			new(hander.UserBank))
		// 会员存款管理
		group.REST("user_deposit", 			new(hander.UserDeposit))
		group.PUT( "user_deposit_lock",		new(hander.UserDeposit).Lock)
		// 会员取款管理
		group.REST("user_withdraw", 		new(hander.UserWithdraw))
		group.PUT( "user_withdraw_lock",	new(hander.UserWithdraw).Lock)
		// 任务管理
		group.REST("task", 					new(hander.Task))
		// 派单任务管理
		group.REST("task_publish", 			new(hander.TaskPublish))
		// 接单任务管理
		group.REST("task_subscribe",		new(hander.TaskSubscribe))
		// 报表 - 看板
		group.GET( "report_dashboards",		new(report.ReportDashboard).Get)
		// 账单
		group.REST("bill",					new(hander.Bill))
		// 配置类型
		group.REST("site_configs_type",		new(config.SiteConfigsType))
		// 配置
		group.REST("site_configs",			new(config.SiteConfigs))
		group.GET( "site_type_config",		new(config.SiteConfigs).Option)
		// 其他细微操作补充
		// code fixme eros

	})

}




