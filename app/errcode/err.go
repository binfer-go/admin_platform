package errcode

import "errors"

//go:generate generrcode

var (
	Success           = errors.New("Success")              // 成功
	Failure       	  = errors.New("Failure")         		// 系统错误
	InvalidToken  	  = errors.New("invalid token")        // 无效的Token
	InvalidParam      = errors.New("invalid parameter")    // 参数非法
	RequestFrequently = errors.New("request frequently")   // 请求过于频繁,请稍后再试
	InvalidSMSCode    = errors.New("invalid sms code")     // 验证码错误
	CodeExpire     	  = errors.New("sms code had expire")  // 验证码已过期
	UserAlreadyExist  = errors.New("user already exist")   // 用户已存在
	InvalidPassword   = errors.New("invalid password")     // 密码错误
	UserNotExist      = errors.New("user not exist")       // 用户不存在
	TaskPubOrderNotExist     = errors.New("task order not exist")  // 任务订单不存在
	TaskPubOrderExpiration   = errors.New("task order expiration") // 任务订单已失效
	TaskOrderAlreadyExist    = errors.New("task already exist")    // 任务订单已存在
	TimeError    			= errors.New("time format error")    	// 时间格式非法
	CreateTaskError    		= errors.New("create task error")    	// 创建任务失败
	UpdateTaskError    		= errors.New("update task error")    	// 更新任务失败
	UpdateTaskNotExist    	= errors.New("task not exist")    		// 任务不存在
	CreateAdminError    	= errors.New("create admin error")    	// 创建管理员失败
	UpdateAdminError    	= errors.New("update admin error")    	// 更新管理员失败
	AdminNotExist    		= errors.New("admin not exist")    	// 管理员不存在
	AdminAlreadyExist    	= errors.New("admin already exist")    // 管理员已存在
	LoginError    			= errors.New("login error")    		// 登陆失败
	LoginStatusError    	= errors.New("login status disable")   // 账户已禁用， 请联系管理员
	AdminAccountLimitError  = errors.New("account error")   		// 账户限制5-40个字符
	AdminPasswordLimitError = errors.New("password error")   		// 密码限制5-40个字符
	PublishPassError 		= errors.New("publish task error")     // 发布任务不可修改
	SubscribePassError 		= errors.New("subscribe task error")   // 接单任务不可修改
	OrderTaskLockError 		= errors.New("order task is lock status")   // 订单任务处于锁定状态
	UserUpdateError 		= errors.New("user update failure")   // 会员更新失败
	AdminRoleError 			= errors.New("admin role error")      // 管理角色名称限制2-40个字符
	AdminRoleAddError 		= errors.New("admin role create failure")      // 管理角色创建失败
	AdminRoleEditError 		= errors.New("admin role update failure")      // 管理角色更新失败
	AdminRoleIsAlready 		= errors.New("admin role already exist")       // 管理角色名称已经存在




)
