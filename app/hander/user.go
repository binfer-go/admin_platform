package hander

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/model"
	"platform/app/server"
	"platform/app/server/report"
	"platform/library/help"
	"platform/library/response"
	"strings"
	"time"
)


type User struct {}


type getUserReq struct {
	UserId int32 `json:"user_id"`
}

type putEditUserReq struct {
	Id int32 `json:"id"`
	RealName string `json:"real_name"`
	NickName string `json:"nick_name"`
	Status byte `json:"status"`
	UPDATEDAT time.Time `json:"updated_at"`
}

type patchActionUserReq struct {
	UserId int32 `json:"user_id"`
	Phone string `json:"phone"`
	PublishStatus int32 `json:"publish_status"`
	SubscribeStatus int32 `json:"subscribe_status"`
	WithdrawStatus int32 `json:"withdraw_status"`
	MessageStatus int32 `json:"message_status"`
	LoginStatus int32 `json:"login_status"`
	Remark string `json:"remark"`
	Image string `json:"image"`
	CreatedAt time.Time `json:"created_at"`
}

type getListUserReq struct {
	Id int32 `json:"id"`
	Status byte `json:"status"`			// 1：启用 2：禁用
	Username string `json:"username"`
	RealName string `json:"real_name"`
	Phone string `json:"phone"`
	ParentName string `json:"parent_name"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	RegIp string `json:"reg_ip"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

/**
 * @api {get} /v1/user  会员列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 会员管理 User
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			Id查询详情
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {String}  username		会员账户
 * @apiParam {String}  phone		电话
 * @apiParam {String}  real_name	真实姓名
 * @apiParam {String}  reg_ip		注册IP
 * @apiParam {Integer} status		状态 {1：启用 2：禁用} {config: user_status}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id               int32     `plat:"primary_key;id" json:"id"`                   // 用户id
		Username         string    `plat:"username" json:"username"`                   // 用户名
		Nickname         string    `plat:"nickname" json:"nickname"`                   // 昵称
		Password         string    `plat:"password" json:"password"`                   // 用户密码
		WithdrawPassword string    `plat:"withdraw_password" json:"withdraw_password"` // 提现密码
		ParentId         int32     `plat:"parent_id" json:"parent_id"`                 // 上级id
		AgentJoin        string    `plat:"agent_join" json:"agent_join"`               // 代理线
		RealName         string    `plat:"real_name" json:"real_name"`                 // 真实姓名
		Phone            string    `plat:"phone" json:"phone"`                         // 手机号
		Balance          int32     `plat:"balance" json:"balance"`                     // 发布余额
		Commission       int32     `plat:"commission" json:"commission"`               // 佣金
		Avatar           string    `plat:"avatar" json:"avatar"`                       // 头像链接
		CreatedAt        time.Time `plat:"created_at" json:"created_at"`               // 创建时间
		UpdatedAt        time.Time `plat:"updated_at" json:"updated_at"`               // 更新时间
		CreatedIp        string    `plat:"created_ip" json:"created_ip"`               // 注册ip
		LastLoginIp      string    `plat:"last_login_ip" json:"last_login_ip"`         // 最后登录ip
		LastLoginTime    time.Time `plat:"last_login_time" json:"last_login_time"`     // 最后登录时间
		LoginCount       int32     `plat:"login_count" json:"login_count"`             // 登陆次数
		Status           byte      `plat:"status" json:"status"`                       // 1:启用 2:禁用
		Remark           string    `plat:"remark" json:"remark"`                       // 备注
		},
		"msg": "成功",
		"page": {
			"TotalPage": 1,
			"TotalSize": 1,
			"CurrentPage": 1,
			"PageBarNum": 10
		}
	}
 * @apiErrorExample Error-Response:
 *  {
 *     "code": 201,
 *     "data": null
 *     "msg": "失败提示",
 *  }
*/
func (*User)Get(req *ghttp.Request)  {
	var list getListUserReq

	where := g.Map{}
	if err := req.Parse(&list); err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if list.Start_time.Unix() > 0 {
		if list.Start_time.Unix() < list.End_time.Unix() {
			where["created_at between ? and ?"] = g.Slice{list.Start_time, list.End_time}
		} else {
			response.Json(req, errcode.ErrCodeTimeError, "")
		}
	}
	if list.Status > 0 {
		where["status"] = list.Status
	}
	if list.Username != "" {
		where["username"]= list.Username
	}
	if list.Phone != "" {
		where["phone"] = list.Phone
	}
	if list.RealName != "" {
		where["real_name"] = list.RealName
	}
	if list.RegIp != "" {
		where["reg_ip"] = list.RegIp
	}
	if list.Id > 0 {
		where["id"] = list.Id
	}
	result, pages, _ := server.ModelUser.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}



/**
 * @api {get} /v1/user  更新会员信息
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 会员管理 User
 * @apiParam {Integer} id		 	   * ID
 * @apiParam {String}  real_name		 真实姓名
 * @apiParam {String}  nick_name	 	 用户昵称
 * @apiParam {Integer} status			 状态 	{ 1：启用 2：禁用 }
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1,
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*User) Put (req *ghttp.Request)  {
	var edit putEditUserReq

	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if edit.Id == 0 {
		response.Json(req, errcode.ErrCodeUserNotExist, "")
	}
	info, err := server.ModelUser.GetById(edit.Id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeUserNotExist, "")
		return
	}
	var userModel model.User
	_ = info.Struct(&userModel)
	edit.UPDATEDAT = time.Now()
	if edit.Status == server.USER_STATUS_ENABLE || edit.Status == server.USER_STATUS_DISABLE {
		edit.Status = edit.Status
	}
	data := help.Filter(edit)
	status, err := server.ModelUser.Update(edit.Id, data)
	if err != nil || status != nil {
		log, _ := json.Marshal(&edit)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Action = server.ADMIN_LOG_ACTION_UPDATE
			options.Title  = env.F[env.ADMIN_MODULE_USER]
			options.Description = string(log)
			options.ActionAdminId = Admins.Id
			options.ActionAdminName = Admins.Account
			options.ActionUserId = userModel.Id
			options.ActionUserName = userModel.Username
			options.ActionAdminIp = req.GetClientIp()
		})
	}
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}

/**
 * @api {patch} /v1/user  会员状态解、封
 * @apiVersion 0.1.0
 * @apiName  状态
 * @apiGroup 会员管理 User
 * @apiHeader (Header) {String} Content-Type 	* multipart/form-data
 * @apiHeader (Header) {String} authorization   * Bearer token
 * @apiParam {Integer}  user_id		 	   	* 会员id
 * @apiParam {Integer}  publish_status		* 发布任务限制时间  	{config: user_action_status}
 * @apiParam {Integer}  subscribe_status	* 接受任务限制时间	{config: user_action_status}
 * @apiParam {Integer}  withdraw_status	 	* 提现限制时间		{config: user_action_status}
 * @apiParam {Integer}  message_status	 	* 发信息限制时间		{config: user_action_status}
 * @apiParam {Integer}  login_status		* 登陆限制时间		{config: user_action_status}
 * @apiParam {String}   remark				  备注
 * @apiParam {File}     image				  上传文件
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
    "api": 1583482081,
    "code": 200,
    "data": null,
    "msg": "成功",
    "time": 1583566273
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func  (*User) Patch (req *ghttp.Request)  {

	var action patchActionUserReq
	if err := req.Parse(&action); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if action.UserId == 0 {
		response.Json(req, errcode.ErrCodeUserNotExist, "")
	}
	userResult, err := server.ModelUser.GetById(action.UserId)
	if err != nil || userResult == nil {
		response.Json(req, errcode.ErrCodeUserNotExist, "")
		return
	}
	var userModel model.User
	_ = userResult.Struct(&userModel)
	userModel.WithdrawStatus = action.WithdrawStatus
	userModel.MessageStatus = action.MessageStatus
	userModel.LoginStatus = action.LoginStatus
	userModel.PublishStatus = action.PublishStatus
	userModel.SubscribeStatus = action.SubscribeStatus
	userModel.LastActionStatusTime = time.Now()
	action.CreatedAt = time.Now()
	action.Phone = userModel.Phone
	imgs, err := help.Uploads(req, server.SITE_UPLOAD_REQUEST_PARAM_NAME, Admins.Id)
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, err.Error())
	}
	if imgs != nil {
		action.Image = imgs.(string)
	} else {
		action.Image = "{}"
	}
	if tx, err := g.DB().Begin(); err == nil {
		_, err := server.ModelUser.Update(action.UserId, userModel)
		if err != nil {
			_ = tx.Rollback()
		} else {
			log, _ := json.Marshal(&action)
			server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
				options.Level = server.ADMIN_LOG_LEVEL_WARNING
				options.Action= server.ADMIN_LOG_ACTION_UPDATE
				options.Module= env.ADMIN_MODULE_USER_ACTION
				options.Title = env.F[env.ADMIN_MODULE_USER_ACTION]
				options.Description = string(log)
				options.ActionAdminId = Admins.Id
				options.ActionAdminName = Admins.Account
				options.ActionUserId = userModel.Id
				options.ActionUserName = userModel.Phone
				options.ActionAdminIp = req.GetClientIp()
			})
			_ = tx.Commit()
			response.Json(req, errcode.ErrCodeSuccess, "")
		}
	} else {
		response.Json(req, errcode.ErrCodeFailure, err.Error())
	}
	
}



/**
 * @api {get} /v1/user_info  会员组合信息
 * @apiVersion 0.1.0
 * @apiName  报表
 * @apiGroup 会员管理 User
 * @apiParam {Integer}  user_id   * 会员id
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id                       int32     `plat:"primary_key;id" json:"id"`                                         // 用户数据累计表
		UserId                   int32     `plat:"user_id" json:"user_id"`                                           // 用户id
		UserParentId             int32     `plat:"user_parent_id" json:"user_parent_id"`                             // 直属上级
		Phone                    string    `plat:"phone" json:"phone"`                                               // 用户电话
		Username                 string    `plat:"username" json:"username"`                                         // 用户名
		UserChildrerCount        int32     `plat:"user_childrer_count" json:"user_childrer_count"`                   // 下级会员个数
		TaskPubCount             int32     `plat:"task_pub_count" json:"task_pub_count"`                             // 发布任务数
		TaskPubChildrerCount     int32     `plat:"task_pub_childrer_count" json:"task_pub_childrer_count"`           // 发布任务量(子任务)
		TaskPubEndCount          int32     `plat:"task_pub_end_count" json:"task_pub_end_count"`                     // 结束的发布任务数
		TaskPubEndChildrerCount  int32     `plat:"task_pub_end_childrer_count" json:"task_pub_end_childrer_count"`   // 结束的发布任务量
		TaskPubWaitCount         int32     `plat:"task_pub_wait_count" json:"task_pub_wait_count"`                   // 进行中的发布任务数
		TaskPubWaitChildrerCount int32     `plat:"task_pub_wait_childrer_count" json:"task_pub_wait_childrer_count"` // 进行中的任务发布量
		TaskSubWaitCount         int32     `plat:"task_sub_wait_count" json:"task_sub_wait_count"`                   // 进行中的接单数
		TaskSubEndCount          int32     `plat:"task_sub_end_count" json:"task_sub_end_count"`                     // 已完成的接单数
		ComissionTaskSum         int32     `plat:"comission_task_sum" json:"comission_task_sum"`                     // 佣金(任务佣金)
		ComissionPromotionSum    int32     `plat:"comission_promotion_sum" json:"comission_promotion_sum"`           // 佣金(推广佣金)
		WithdrawTaskSum          int32     `plat:"withdraw_task_sum" json:"withdraw_task_sum"`                       // 提现(任务钱包提现)
		WithdrawMasterSum        int32     `plat:"withdraw_master_sum" json:"withdraw_master_sum"`                   // 提现(主钱包提现)
		DepositTaskSum           int32     `plat:"deposit_task_sum" json:"deposit_task_sum"`                         // 任务钱包收益
		DepositMasterSum         int32     `plat:"deposit_master_sum" json:"deposit_master_sum"`                     // 主钱包收益
		LoginCount               int32     `plat:"login_count" json:"login_count"`                                   // 累计登陆次数
		CreatedAt                time.Time `plat:"created_at" json:"created_at"`                                     // 注册时间
		UpdatedAt                time.Time `plat:"updated_at" json:"updated_at"`                                     // 最后更新时间
		PublishStatus    		 int32     `plat:"publish_status" json:"publish_status"`       // 发布任务限制时间  1：正常; 其他：异常限制
		SubscribeStatus  		 int32     `plat:"subscribe_status" json:"subscribe_status"`   // 接受任务限制时间  1：正常; 其他：异常限制
		WithdrawStatus   		 int32     `plat:"withdraw_status" json:"withdraw_status"`     // 提现限制时间  1：正常; 其他：异常限制
		MessageStatus    		 int32     `plat:"message_status" json:"message_status"`       // 发送消息限制时间  1：正常; 其他：异常限制
		LoginStatus      		 int32     `plat:"login_status" json:"login_status"`           // 登陆限制时间  1：正常; 其他：异常限制
		},
		"msg": "成功",
	}
 * @apiErrorExample Error-Response:
 *  {
 *     "code": 201,
 *     "data": null
 *     "msg": "失败提示",
 *  }
*/
func (*User) Info (req *ghttp.Request)  {
	var get getUserReq

	if err := req.Parse(&get); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	user, err := server.ModelUser.GetById(get.UserId)
	if err != nil || user == nil {
		response.Json(req, errcode.ErrCodeUserNotExist, "")
	}
	where := g.Map{}
	where["u.id"] = get.UserId
	fields := "u.balance, u.commission, u.agent_join, u.real_name, u.publish_status, u.subscribe_status, u.withdraw_status, u.message_status, u.login_status, u.last_action_status_time, u.last_login_time, r.*"
	info, err := report.ModelReportUser.GetLeftUser(where, fields)
	if err != nil {
		response.Json(req, errcode.ErrCodeUserNotExist, "")
		return
	}
	data := info.List()
	for _, v := range data {
		v["balance"] 	= help.Decimal(gconv.Float64(v["balance"]))
		v["commission"] = help.Decimal(gconv.Float64(v["commission"]))
		for key, val := range v {
			if strings.Contains(key, "_sum") {
				v[key] = help.Decimal(gconv.Float64(val))
			}
			if strings.Contains(key, "_status") {
				last_action_status_time := gconv.Time(v["last_action_status_time"]).Unix() + gconv.Int64(val)
				if val != server.USER_STATUS_ACTION_STEP_0 {
					if last_action_status_time > time.Now().Unix() {
						v[key] = last_action_status_time
					} else {
						v[key] = server.USER_STATUS_ACTION_STEP_0
					}
				}
			}
		}
	}
	response.Json(req, errcode.ErrCodeSuccess, "", data)

}











