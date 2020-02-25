package hander

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"platform/app/errcode"
	"platform/app/server"
	"platform/library/help"
	"platform/library/response"
	"time"
)


type User struct {}

type putEditUserReq struct {
	Id int32 `json:"id"`
	Username string `json:"username"`
	RealName string `json:"real_name"`
	Status byte `json:"status"`
	UPDATEDAT time.Time `json:"updated_at"`
}

type getListUserReq struct {
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
 * @apiParam {String}  start_time   开始时间
 * @apiParam {String}  end_time		结束时间
 * @apiParam {String}  username		会员账户
 * @apiParam {String}  phone		电话
 * @apiParam {String}  real_name	真实姓名
 * @apiParam {String}  reg_ip		注册IP
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
	result, pages, _ := server.ModelUser.GetPageList(where, list.Page, list.PageSize)

	response.Json(req, errcode.ErrCodeSuccess, "", result, pages)

}



/**
 * @api {get} /v1/user  更新会员信息
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 会员管理 User
 * @apiParam {Integer} ID		 	   * ID
 * @apiParam {String}  real_name		 真实姓名
 * @apiParam {String}  username	 		 用户标识
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
func (task *User) Put (req *ghttp.Request)  {
	var edit putEditUserReq

	id := req.GetInt32("id", 0)
	if id == 0 {
		response.Json(req, errcode.ErrCodeUserNotExist, "")
	}
	info, err := server.ModelUser.GetById(id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeUserNotExist, "")
	}
	if err := req.Parse(&edit); err != nil {

		response.Json(req, errcode.ErrCodeUserUpdateError, "解析失败")
	}

	edit.UPDATEDAT = time.Now()
	data := help.Filter(edit)
	status, err := server.ModelUser.Update(id, data)

	response.Json(req, errcode.ErrCodeSuccess, "", status)

}
