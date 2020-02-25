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


type AdminRole struct {}

type putEditAdminRoleReq struct {
	Id int32 `json:"id"`
	Status byte `json:"status"`
	RoleName string `json:"role_name"`
	Remark string `json:"remark"`
	UpdatedAt time.Time `json:"updated_at"`
}

type getListAdminRoleReq struct {
	RoleName string `json:"role_name"`
	Status byte `json:"status"`
	Start_time time.Time `json:"start_time"`
	End_time time.Time `json:"end_time"`
	Page int `json:"page"`
	PageSize int `json:"page_size"`
}

/**
 * @api {get} /v1/admin_role  管理角色列表
 * @apiVersion 0.1.0
 * @apiName  列表
 * @apiGroup 管理角色 AdminRole
 * @apiParam {Integer} page			1
 * @apiParam {Integer} page_size	20
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {String}  role_name    角色名称
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
func (*AdminRole)Get(req *ghttp.Request)  {
	var list getListAdminRoleReq

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
	if list.RoleName != "" {
		where["role_name"]= list.RoleName
	}

	result, pages, _ := server.ModelAdminRole.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}


/**
 * @api {post} /v1/admin_role  添加管理角色
 * @apiVersion 0.1.0
 * @apiName  添加
 * @apiGroup 管理角色 AdminRole
 * @apiParam {String}  role_name		* 角色名称 	{ 4 - 40个字符 }
 * @apiParam {Integer} status			* 状态 	{ 1：启用 2：禁用 }
 * @apiParam {String}  remark			  备注
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
func (*AdminRole) Post (req *ghttp.Request)  {
	var add model.AdminRole

	if err := req.Parse(&add); err != nil {
		response.Json(req, errcode.ErrCodeAdminRoleAddError, "")
	}
	if len(add.RoleName) < 2 || len(add.RoleName) > 40 {

		response.Json(req, errcode.ErrCodeAdminRoleError, "")
	}

	info, err := server.ModelAdminRole.GetByRoleName(add.RoleName)
	if err != nil || info != nil{
		response.Json(req, errcode.ErrCodeAdminRoleIsAlready, "")
	}

	add.CreatedIp = req.GetClientIp()
	add.CreatedAt = time.Now()
	add.UpdatedAt = time.Now()
	add.Status = server.ADMIN_ROLE_STATUS_ENABLE
	data := help.Filter(add)
	if data == nil {

		response.Json(req, errcode.ErrCodeAdminRoleAddError, "")
	}
	result, err := server.ModelAdminRole.Create(add)
	if err != nil {

		response.Json(req, errcode.ErrCodeAdminRoleAddError, "")
	}

	response.Json(req, errcode.ErrCodeSuccess, "", result)

}




/**
 * @api {put} /v1/admin_role  更新管理角色
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 管理角色 AdminRole
 * @apiParam {Integer} ID		 	   * ID
 * @apiParam {String}  role_name	   * 角色名称
 * @apiParam {Integer} status		   * 状态 	{ 1：启用 2：禁用 }
 * @apiParam {String}  remark			 备注
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
func (task *AdminRole) Put (req *ghttp.Request)  {
	var edit putEditAdminRoleReq

	id := req.GetInt32("id", 0)
	if id == 0 {
		response.Json(req, errcode.ErrCodeAdminRoleEditError, "")
	}
	info, err := server.ModelAdminRole.GetById(id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeAdminRoleEditError, "")
	}
	if err := req.Parse(&edit); err != nil {

		response.Json(req, errcode.ErrCodeAdminRoleEditError, "解析失败")
	}
	if len(edit.RoleName) < 4 {
		response.Json(req, errcode.ErrCodeAdminRoleError, "")
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)
	status, err := server.ModelAdminRole.Update(id, data)
	if err != nil {

		response.Json(req, errcode.ErrCodeAdminRoleEditError, "")
	}
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}
