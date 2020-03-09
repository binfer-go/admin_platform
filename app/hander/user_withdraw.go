package hander

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
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
	UpdatedAt time.Time `json:"updated_at"`
}



/**
 * @api {get} /v1/user_deposit  会员取款列表
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
 * @api {put} /v1/user_deposit   更新会员取款信息
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 会员取款 Withdraw
 * @apiParam {Integer} id			  * 存款Id
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
	// 通过 or 拒绝
	if modelUserWithdraw.Status == server.USER_WITHDRAW_STATUS_SUCCESS || modelUserWithdraw.Status == server.USER_WITHDRAW_STATUS_FAILURE {
		// 处理RPC通知
	} else {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	result, err := server.ModelUserWithdraw.Update(edit.Id, data)
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
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
	response.Json(req, errcode.ErrCodeSuccess, "", result)

}



