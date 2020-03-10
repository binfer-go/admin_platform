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

type UserDeposit struct {}

type getListUserDepositReq struct {

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

type putEditUserDepositReq struct {
	Id int32 `json:"id"`
	Status    byte      `json:"status"`
	Remark string `json:"remark"`
	UpdatedAt time.Time `json:"updated_at"`
}


type patchDepositReq struct {
	UserId int32 `json:"user_id"`
	Wallet byte `json:"wallet"`
	Money float64 `json:"money"`
}


/**
 * @api {get} /v1/user_deposit  会员存款列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 会员存款 Deposit
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			Id查询详情
 * @apiParam {String}  username   	用户名
 * @apiParam {String}  phone   		手机号
 * @apiParam {String}  admin_account操作人
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {Integer} status		状态 {1：提现中 2：审核中 3：成功 4：拒绝} {config: user_deposit_status}
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
		PayType      byte      `plat:"pay_type" json:"pay_type"`           // 1:支付宝 2:微信 3:银行卡转账
		Amount       int32     `plat:"amount" json:"amount"`               // 交易金额
		RealAmount   int32     `plat:"real_amount" json:"real_amount"`     // 实际到账金额
		BankId       int32     `plat:"bank_id" json:"bank_id"`             // 用户银行卡ID(备用)
		BankName     string    `plat:"bank_name" json:"bank_name"`         // 用户银行卡名称(备用)
		Status       byte      `plat:"status" json:"status"`               // 1:等待支付 2:成功 3:失败 4:待人工审核
		AdminAccount string    `plat:"admin_account" json:"admin_account"` // 操作人账号
		CreatedAt    time.Time `plat:"created_at" json:"created_at"`       // 创建时间
		UpdatedAt    time.Time `plat:"updated_at" json:"updated_at"`       // 变动时间
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
func (*UserDeposit)Get(req *ghttp.Request)  {
	var list getListUserDepositReq

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
	result, pages, _ := server.ModelUserDeposit.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {put} /v1/user_deposit   更新会员存款信息
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 会员存款 Deposit
 * @apiParam {Integer} id			  * 存款Id {status == 2, 才可以审核}
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
func (*UserDeposit) Put (req *ghttp.Request)  {
	var edit putEditUserDepositReq

	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	lockName := redis.ADMIN_LOCK_TIME_DEPOSIT+gconv.String(edit.Id)
	ts := redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, nil)
	if ts != 0 {
		response.Json(req, errcode.ErrCodeFailure, fmt.Sprintf("请不要频繁操作, 剩余时间: %v 秒.", ts))
	}
	if edit.Id == 0 {
		response.Json(req, errcode.ErrCodeAdminDepositNotExist, "")
	}
	info, err := server.ModelUserDeposit.GetById(edit.Id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeAdminDepositNotExist, "")
		return
	}
	var modelUserDeposit model.UserDeposit
	_ = info.Struct(&modelUserDeposit)
	if modelUserDeposit.Status != server.USER_DEPOSIT_STATUS_INSPECTION {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	var status bool
	switch edit.Status {
	case server.USER_DEPOSIT_STATUS_SUCCESS:
		status = true
	case server.USER_DEPOSIT_STATUS_FAILURE:
		status = false
	}
	// 锁定订单
	redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, time.Now())

	ctx, _ := context.WithTimeout(context.TODO(), time.Second * 3)
	_, err = rpc.GrpcConn().HandleRecharge(ctx, &rpc.HandleRechargeRequest{
		Id:                   edit.Id,
		Status:               status,
		Account:              Admins.Account,
		Remark:               edit.Remark,
		Amount:               modelUserDeposit.Amount,
	})
	if err != nil {
		glog.Level(glog.LEVEL_ERRO).Printf("--10086 - 审核存款失败,", &rpc.HandleRechargeRequest{})
		response.Json(req, errcode.ErrCodeFailure, err.Error())
	}
	log, _ := json.Marshal(&edit)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Action = server.ADMIN_LOG_ACTION_UPDATE
		options.Title  = env.F[env.ADMIN_MODULE_USER_DEPOSIT]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	glog.Level(glog.LEVEL_ERRO).Printf("--10086 - 审核存款成功,", &rpc.HandleRechargeRequest{})
	response.Json(req, errcode.ErrCodeSuccess, "", edit)

}



/**
 * @api {patch} /v1/user_deposit   人工加款
 * @apiVersion 0.1.0
 * @apiName  人工
 * @apiGroup 会员存款 Deposit
 * @apiParam {Integer} user_id			* 会员id
 * @apiParam {String}  wallet			* 会员钱包类型 {config: user_wallet_type}
 * @apiParam {Float}   money			* 交易金额/元
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
func (*UserDeposit) Patch (req *ghttp.Request)  {
	var patch patchDepositReq

	if err := req.Parse(&patch); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	lockName := redis.ADMIN_LOCK_TIME_MANUAL_DEPOSIT+gconv.String(patch.UserId)
	ts := redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, nil)
	if ts != 0 {
		response.Json(req, errcode.ErrCodeFailure, fmt.Sprintf("请不要频繁操作, 剩余时间: %v 秒.", ts))
	}

	user, err := server.ModelUser.GetById(patch.UserId)
	if err != nil || user == nil {
		response.Json(req, errcode.ErrCodeUserNotExist, "")
		return
	}
	if patch.Wallet < server.USER_WALLET_TYPE_MASTER || patch.Wallet > server.USER_WALLET_TYPE_COMISSION {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	var modelUser model.User
	_ = user.Struct(&modelUser)
	if patch.Money <= 0 {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	// 锁定订单
	redis.ModelRedis.Lock(lockName, redis.ADMIN_LOCK_TIME, time.Now())
	ctx, _ := context.WithTimeout(context.TODO(), time.Second * 3)
	_, err = rpc.GrpcConn().ManualUserAmount(ctx, &rpc.ManualUserAmountRequest{
		UserId:             modelUser.Id,
		Username:           modelUser.Username,
		Phone:              modelUser.Phone,
		Amount:             help.DecimalIntVal(patch.Money),
		Account:            Admins.Account,
		Status:             true,
		Wallet:             rpc.Wallet(patch.Wallet),
	})
	if err != nil {
		glog.Level(glog.LEVEL_ERRO).Printf("--10010 - 人工存款失败,", &rpc.ManualUserAmountRequest{})
		response.Json(req, errcode.ErrCodeFailure, err.Error(), patch)
	} else {
		log, _ := json.Marshal(&patch)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Level = server.ADMIN_LOG_LEVEL_WARNING
			options.Action= server.ADMIN_LOG_ACTION_CREATE
			options.Module= env.ADMIN_MODULE_USER_DEPOSIT
			options.Title = env.F[env.ADMIN_MODULE_USER_DEPOSIT]
			options.Description = string(log)
			options.ActionAdminId = Admins.Id
			options.ActionAdminName = Admins.Account
			options.ActionUserId = modelUser.Id
			options.ActionUserName = modelUser.Phone
			options.ActionAdminIp = req.GetClientIp()
		})
		glog.Level(glog.LEVEL_ERRO).Printf("--10010 - 人工存款成功,", &rpc.ManualUserAmountRequest{})
		response.Json(req, errcode.ErrCodeSuccess, "", patch)
	}
}