package hander

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/glog"
	"github.com/gogf/gf/util/gconv"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/hander/env/rpc"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
	"platform/library/redis"
	"platform/library/response"
	"time"
)

type UserWithdraw struct {}

type getListUserWithdrawReq struct {

	Id int32 `json:"id"`
	Username string `json:"username"`
	Phone string `json:"phone"`
	AdminAccount string `json:"admin_account"`
	Status byte `json:"status"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

type putEditUserWithdrawReq struct {
	Id int32 `json:"id"`
	Status    byte      `json:"status"`
	Remark    string `json:"remark"`
	UpdatedAt time.Time `json:"updated_at"`
}

type patchWithdrawReq struct {
	UserId int32 `json:"user_id"`
	Wallet byte `json:"wallet"`
	Money float64 `json:"money"`
}

type putLockWithdrawReq struct {
	Id int32 `json:"id"`
}
/**
 * @api {get} /v1/user_withdraw  会员取款列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 会员取款 Withdraw
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			Id查询详情
 * @apiParam {String}  username   	用户名
 * @apiParam {String}  phone   		手机号
 * @apiParam {String}  admin_account操作人
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {Integer} status		状态 {1：提现中 2：审核中 3：成功 4：拒绝} {config: user_withdraw_status}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id           int32     `plat:"primary_key;id" json:"id"`
		UserId       int32     `plat:"user_id" json:"user_id"`             // 用户ID
		Username     string    `plat:"username" json:"username"`           // 用户名
		Phone        string    `plat:"phone" json:"phone"`                 // 电话
		Amount       int32     `plat:"amount" json:"amount"`               // 提现金额
		BankId       int64     `plat:"bank_id" json:"bank_id"`             // 银行卡卡号
		BankName     string    `plat:"bank_name" json:"bank_name"`         // 银行名字
		Status       byte      `plat:"status" json:"status"`               // 状态：1：提现中 2：审核中 3：成功 4：拒绝
		AdminAccount string    `plat:"admin_account" json:"admin_account"` // 操作人账号
		CreatedAt    time.Time `plat:"created_at" json:"created_at"`       // 创建时间
		UpdatedAt    time.Time `plat:"updated_at" json:"updated_at"`       // 变更时间
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
func (*UserWithdraw)Get(req *ghttp.Request)  {
	var list getListUserWithdrawReq

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
		where["username"] = list.Username
	}
	if list.Phone != "" {
		where["phone"] = list.Phone
	}
	if list.AdminAccount != "" {
		where["admin_account"] = list.AdminAccount
	}
	if list.Id > 0 {
		where["id"] = list.Id
	}
	result, pages, _ := server.ModelUserWithdraw.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {put} /v1/user_withdraw   更新会员取款信息(审核)
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 会员取款 Withdraw
 * @apiParam {Integer} id			  * 存款Id {status= 2才可以审核}
 * @apiParam {Integer} status			状态 {3：成功 4：拒绝}
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
func (*UserWithdraw) Put (req *ghttp.Request)  {
	var edit putEditUserWithdrawReq

	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	lockName := redis.ADMIN_LOCK_TIME_WITHDRAW+gconv.String(edit.Id)
	ts := redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, nil)
	if ts != 0 {
		response.Json(req, errcode.ErrCodeFailure, fmt.Sprintf("请不要频繁操作, 剩余时间: %v 秒.", ts))
	}
	if edit.Id == 0 {
		response.Json(req, errcode.ErrCodeAdminWithDrawNotExist, "")
	}
	info, err := server.ModelUserWithdraw.GetById(edit.Id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeAdminWithDrawNotExist, "")
		return
	}
	var modelUserWithdraw model.UserWithdraw
	_ = info.Struct(&modelUserWithdraw)
	if modelUserWithdraw.AdminAccount != Admins.Account {
		response.Json(req, errcode.ErrCodeLockError, "")
	}
	if modelUserWithdraw.Status != server.USER_WITHDRAW_STATUS_INSPECTION {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	var status bool
	switch edit.Status {
	case server.USER_WITHDRAW_STATUS_SUCCESS:
		status = true
	case server.USER_WITHDRAW_STATUS_FAILURE:
		status = false
	}
	// 锁定订单
	redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, time.Now())

	ctx, _ := context.WithTimeout(context.TODO(), time.Second * 3)
	_, err = rpc.GrpcConn().HandleWithdraw(ctx, &rpc.HandleWithdrawRequest{
		Id:                   edit.Id,
		Status:               status,
		Account:              Admins.Account,
		Remark:               edit.Remark,
		Amount:               modelUserWithdraw.Amount,
	})
	if err != nil {
		glog.Level(glog.LEVEL_ERRO).Printf("--10086 - 审核取款失败,", &rpc.HandleWithdrawRequest{})
		response.Json(req, errcode.ErrCodeFailure, err.Error())
	}
	log, _ := json.Marshal(&edit)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Action = server.ADMIN_LOG_ACTION_UPDATE
		options.Title  = env.F[env.ADMIN_MODULE_USER_WITHDRAW]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	glog.Level(glog.LEVEL_ERRO).Printf("--10086 - 审核取款成功,", &rpc.HandleWithdrawRequest{})
	response.Json(req, errcode.ErrCodeSuccess, "", edit)

}



/**
 * @api {patch} /v1/user_withdraw   人工扣款
 * @apiVersion 0.1.0
 * @apiName  人工
 * @apiGroup 会员取款 Withdraw
 * @apiParam {Integer} user_id			* 会员id
 * @apiParam {String}  wallet			* 会员钱包类型 {config: user_wallet_type}
 * @apiParam {Float} money				* 交易金额/元
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
func (*UserWithdraw) Patch (req *ghttp.Request)  {
	var patch patchWithdrawReq

	if err := req.Parse(&patch); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	lockName := redis.ADMIN_LOCK_TIME_MANUAL_WITHDRAW+gconv.String(patch.UserId)
	if ts := redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, nil); ts != 0 {
		response.Json(req, errcode.ErrCodeFailure, fmt.Sprintf("请不要频繁操作, 剩余时间: %v 秒.", ts))
	}
	user, err := server.ModelUser.GetById(patch.UserId)
	if err != nil || user == nil {
		response.Json(req, errcode.ErrCodeUserNotExist, "")
		return
	}
	var modelUser model.User
	_ = user.Struct(&modelUser)
	if patch.Money == 0 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	switch patch.Wallet {
		case server.USER_WALLET_TYPE_MASTER:
			if help.DecimalIntVal(patch.Money) > modelUser.Balance {
				response.Json(req, errcode.ErrCodeMoneyBalanceNotSufficientError, "")
			}
		case server.USER_WALLET_TYPE_COMISSION:
			if help.DecimalIntVal(patch.Money) > modelUser.Commission {
				response.Json(req, errcode.ErrCodeMoneyComissionNotSufficientError, "")
			}
		default:
			response.Json(req, errcode.ErrCodeFailure, "")
	}
	// 锁定订单
	redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, time.Now())
	ctx, _ := context.WithTimeout(context.TODO(), time.Second * 3)
	_, err = rpc.GrpcConn().ManualUserAmount(ctx, &rpc.ManualUserAmountRequest{
		UserId:               modelUser.Id,
		Username:             modelUser.Username,
		Phone:                modelUser.Phone,
		Amount:               help.DecimalIntVal(patch.Money),
		Account:              Admins.Account,
		Status:               false,
		Wallet:               rpc.Wallet(patch.Wallet),
	})
	if err != nil {
		glog.Level(glog.LEVEL_ERRO).Printf("--10010 - 人工取款失败,", &rpc.ManualUserAmountRequest{})
		response.Json(req, errcode.ErrCodeFailure, err.Error())
	} else {
		log, _ := json.Marshal(&patch)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Level = server.ADMIN_LOG_LEVEL_WARNING
			options.Action= server.ADMIN_LOG_ACTION_CREATE
			options.Module= env.ADMIN_MODULE_USER_WITHDRAW
			options.Title = env.F[env.ADMIN_MODULE_USER_WITHDRAW]
			options.Description = string(log)
			options.ActionAdminId = Admins.Id
			options.ActionAdminName = Admins.Account
			options.ActionUserId = modelUser.Id
			options.ActionUserName = modelUser.Phone
			options.ActionAdminIp = req.GetClientIp()
		})
		glog.Level(glog.LEVEL_ERRO).Printf("--10010 - 人工取款成功,", &rpc.ManualUserAmountRequest{})
		response.Json(req, errcode.ErrCodeSuccess, "", patch)
	}

}


/**
 * @api {put} /v1/user_withdraw_lock   锁定/解锁取款单
 * @apiVersion 0.1.0
 * @apiName  行为
 * @apiGroup 会员取款 Withdraw
 * @apiParam   {Integer}   id	*取款单Id
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

func (*UserWithdraw) Lock (req *ghttp.Request)  {
	var lock putLockWithdrawReq
	if err := req.Parse(&lock); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	info, err := server.ModelUserWithdraw.GetById(lock.Id)
	if err != nil || info == nil {
		response.Json(req, errcode.ErrCodeFailure, "")
		return
	}
	var modelWithdraw model.UserWithdraw
	_ = info.Struct(&modelWithdraw)
	if modelWithdraw.AdminAccount == "" {
		modelWithdraw.AdminAccount = Admins.Account
	} else if modelWithdraw.AdminAccount != Admins.Account {
		response.Json(req, errcode.ErrCodeOrderTaskLockError, "")
	} else {
		modelWithdraw.AdminAccount = ""
	}
	modelWithdraw.UpdatedAt = time.Now()
	status, err := server.ModelUserWithdraw.Update(lock.Id, modelWithdraw)
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}