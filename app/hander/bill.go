package hander

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/server"
	"platform/library/response"
	"time"
)


type Bill struct {}



type getListBillReq struct {
	Id int32 `json:"id"`
	Username string `json:"username"`
	Operate byte `json:"operate"`
	Type byte `json:"type"`
	Role byte `json:"role"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

/**
 * @api {get} /v1/bill  账单流水列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 账单管理 Bill
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {Integer} id			单条信息详情
 * @apiParam {String}  username		用户名
 * @apiParam {Integer} type			账变形式 {config : bill_type}
 * @apiParam {Integer} operate		账变类型 {config : bill_operate}
 * @apiParam {Integer} role			账变方案 {config : bill_role}
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark": {
		Id           int64     `plat:"primary_key;id" json:"id"`
		UserId       int32     `plat:"user_id" json:"user_id"`             // 用户ID
		Username     string    `plat:"username" json:"username"`           // 用户名
		Phone        string    `plat:"phone" json:"phone"`                 // 手机号
		Type         byte      `plat:"type" json:"type"`                   // 账变类型(1:加钱 2:扣钱)
		Operate      byte      `plat:"operate" json:"operate"`             // 1:存款 2:取款 3:发布任务 4:佣金 5:任务结束退回 6:提取佣金
		Src          int32     `plat:"src" json:"src"`                     // 来源ID，默认为系统：0
		Role         byte      `plat:"role" json:"role"`                   // 账变角色
		Amount       int32     `plat:"amount" json:"amount"`               // 交易金额
		BeforeAmount int32     `plat:"before_amount" json:"before_amount"` // 变动前金额
		AfterAmount  int32     `plat:"after_amount" json:"after_amount"`   // 变动后金额
		Desc         string    `plat:"desc" json:"desc"`                   // 账变描述
		CreatedAt    time.Time `plat:"created_at" json:"created_at"`       // 创建时间
		UpdatedAt    time.Time `plat:"updated_at" json:"updated_at"`       // 更新时间
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
func (*Bill)Get(req *ghttp.Request)  {
	var list getListBillReq

	where := g.Map{}
	if err := req.Parse(&list); err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
	}
	if list.Id > 0 {
		where["id"]= list.Id
	}
	if list.Username != "" {
		where["username"]= list.Username
	}
	if list.Type == server.ADMIN_BILL_TYPE_GOLD_ADD || list.Type == server.ADMIN_BILL_TYPE_GOLD_DEL{
		where["type"]= list.Type
	}
	if list.Operate > 0 {
		where["operate"]= list.Operate
	}
	if list.Role == server.ADMIN_BILL_ROLE_SYSTEM || list.Role == server.ADMIN_BILL_ROLE_MANUAL {
		where["role"]= list.Role
	}
	if list.Start_time.Unix() > 0 {
		if list.Start_time.Unix() < list.End_time.Unix() {
			where["created_at between ? and ?"] = g.Slice{list.Start_time, list.End_time}
		} else {
			response.Json(req, errcode.ErrCodeTimeError, "")
		}
	}
	result, pages, _ := server.ModelBill.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}

