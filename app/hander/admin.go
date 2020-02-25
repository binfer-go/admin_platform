package hander

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/model"
	"platform/app/server"
	"platform/library/help"
	"platform/library/response"
	"time"
)
var Admins *model.Admin

type Admin struct {}

type putEditAdminReq struct {
	Id int32 `json:"id"`
	NickName string `json:"nick_name"`
	LoginPassword string `json:"login_password"`
	Status byte `json:"status"`
	UpdatedAt time.Time `json:"updated_at"`
}

type getListAdminReq struct {
	Status byte `json:"status"`			// 1：启用 2：禁用
	Account string `json:"account"`
	RoleId int32 `json:"role_id"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

/**
 * @api {get} /v1/admin  管理员列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 管理账户 Admin
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {String}  account		管理员账户
 * @apiParam {String}  role_id		角色ID
 * @apiParam {Integer} status		状态 {1：启用 2：禁用}
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccess {Object}    page   分页
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
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
func (*Admin)Get(req *ghttp.Request)  {
	var list getListAdminReq

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
	if list.Account != "" {
		where["account"]= list.Account
	}
	if list.RoleId > 0 {
		where["role_id"]= list.RoleId
	}

	result, pages, _ := server.ModelAdmin.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {post} /v1/admin  创建管理员账户
 * @apiVersion 0.1.0
 * @apiName  添加
 * @apiGroup 管理账户 Admin
 * @apiParam {String}  account			* 账户 	{ 5 - 40个字符 }
 * @apiParam {String}  login_password	* 登陆密码 { 6 - 40个字符 }
 * @apiParam {Integer} status			* 状态 	{ 1：启用 2：禁用 }
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
	{
		"code": 200,
		"data": 1000000006,
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
   {
     	"code": 201,
      	"data": null
      	"msg": "失败提示",
   }
*/
func (*Admin) Post (req *ghttp.Request)  {
	var add model.Admin

	if err := req.Parse(&add); err != nil {
		response.Json(req, errcode.ErrCodeCreateAdminError, "")
	}
	if len(add.Account) < 6 || len(add.Account) > 40 {

		response.Json(req, errcode.ErrCodeAdminAccountLimitError, "")
	}
	if len(add.LoginPassword) < 6 || len(add.LoginPassword) > 40 {

		response.Json(req, errcode.ErrCodeAdminPasswordLimitError, "")
	}

	info, err := server.ModelAdmin.GetByAccount(add.Account)
	if err != nil || info != nil{
		response.Json(req, errcode.ErrCodeAdminAlreadyExist, "")
	}
	add.NickName  = add.NickName
	add.RoleId 	= add.RoleId
	add.SecretKey = add.SecretKey
	add.UpdatedAt = time.Now()
	add.CreatedAt = time.Now()
	add.LastLoginTime = time.Now()
	add.LastLoginIp = req.GetClientIp()
	add.CreatedIp = req.GetClientIp()
	add.Status = server.ADMIN_STATUS_ENABLE
	add.LoginCount = 0
	add.CreatedId = Admins.Id
	data := help.Filter(add)
	if data == nil {

		response.Json(req, errcode.ErrCodeCreateAdminError, "")
	}
	result, err := server.ModelAdmin.Create(add)
	if err != nil {

		response.Json(req, errcode.ErrCodeCreateAdminError, "")
	}

	response.Json(req, errcode.ErrCodeSuccess, "", result)

}




/**
 * @api {put} /v1/admin  更新管理员账户
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 管理账户 Admin
 * @apiParam {Integer} ID		 	   * ID
 * @apiParam {String}  nick_name		 昵称
 * @apiParam {String}  login_password	 登陆密码 { 6 - 40个字符 }
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
func (task *Admin) Put (req *ghttp.Request)  {
	var edit putEditAdminReq

	id := req.GetInt32("id", 0)
	if id == 0 {

		response.Json(req, errcode.ErrCodeUpdateAdminError, "")
	}
	info, err := server.ModelAdmin.GetById(id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeAdminNotExist, "")
	}
	if err := req.Parse(&edit); err != nil {

		response.Json(req, errcode.ErrCodeUpdateTaskError, "解析失败")
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	status, err := server.ModelAdmin.Update(id, data)

	response.Json(req, errcode.ErrCodeSuccess, "", status)

}
