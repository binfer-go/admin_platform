package hander

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/hander/env"
	"platform/app/server"
	"platform/library/help"
	"platform/library/response"
	"time"
)


type UserBank struct {}



type getListUserBankReq struct {

	Id int32 `json:"id"`
	Status byte `json:"status"`
	RealName string `json:"real_name"`
	BankId int32 `json:"bank_id"`
	BankName string `json:"bank_name"`
	BankNumber string `json:"bank_number"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

type putEditUserBankReq struct {
	Id int32 `json:"id"`
	Status byte `json:"status"`
	Remark string `json:"remark"`
	UPDATEDAT time.Time `json:"updated_at"`
}

/**
 * @api {get} /v1/user_bank  会员银行卡列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 会员银行卡 UserBank
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			Id查询详情
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {String}  phone		电话
 * @apiParam {Integer} bank_id		银行id(系统银行列表)
 * @apiParam {String}  bank_number	银行卡号
 * @apiParam {String}  real_name	真实姓名
 * @apiParam {Integer} status		状态 {1：启用 2：禁用} {config: user_bank_status}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id          int32     `plat:"primary_key;id" json:"id"`
		UserId      int32     `plat:"user_id" json:"user_id"`           // 用户ID
		Username    string    `plat:"username" json:"username"`         // 用户名
		BankId      int32     `plat:"bank_id" json:"bank_id"`           // 银行id
		BankName    string    `plat:"bank_name" json:"bank_name"`       // 银行名
		BankNumber  string    `plat:"bank_number" json:"bank_number"`   // 银行卡号
		RealName    string    `plat:"real_name" json:"real_name"`       // 持卡人
		BankAddress string    `plat:"bank_address" json:"bank_address"` // 银行地址
		Status      byte      `plat:"status" json:"status"`             // 1:启用 2：禁用
		Remark      string    `plat:"remark" json:"remark"`             // 备注
		CreatedAt   time.Time `plat:"created_at" json:"created_at"`     // 创建时间
		UpdatedAt   time.Time `plat:"updated_at" json:"updated_at"`     // 更新时间
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
func (*UserBank)Get(req *ghttp.Request)  {
	var list getListUserBankReq

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
	if list.RealName != "" {
		where["real_name"] = list.RealName
	}
	if list.BankName != "" {
		where["bank_name"] = list.BankName
	}
	if list.BankId > 0 {
		where["bank_id"] = list.BankId
	}
	if list.BankNumber != "" {
		where["bank_number"] = list.BankNumber
	}
	if list.Id > 0 {
		where["id"] = list.Id
	}
	result, pages, _ := server.ModelUserBank.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}



/**
 * @api {get} /v1/user  更新会员银行卡
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 会员银行卡 UserBank
 * @apiParam {Integer} id		 	   * ID
 * @apiParam {Integer} status			 状态 	{ 1：启用 2：禁用 }
 * @apiParam {String}  remark	 		 备注
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
func (*UserBank) Put (req *ghttp.Request)  {
	var edit putEditUserBankReq
	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if edit.Id == 0 {
		response.Json(req, errcode.ErrCodeUserBankNotExist, "")
	}
	info, err := server.ModelUserBank.GetById(edit.Id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeUserBankNotExist, "")
	}

	edit.UPDATEDAT = time.Now()
	data := help.Filter(edit)
	status, err := server.ModelUserBank.Update(edit.Id, data)
	if err != nil || status != nil {
		log, _ := json.Marshal(&edit)
		server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
			options.Action = server.ADMIN_LOG_ACTION_UPDATE
			options.Title  = env.F[env.ADMIN_MODULE_USER_BANK]
			options.Description = string(log)
			options.ActionAdminId = Admins.Id
			options.ActionAdminName = Admins.Account
			options.ActionAdminIp = req.GetClientIp()
		})
	}
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}
