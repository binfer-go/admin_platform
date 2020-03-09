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
	"platform/library/help"
	"platform/library/redis"
	"platform/library/response"
	"time"
)


type AdminPermission struct {}

type putEditAdminPermissionReq struct {
	Id int32 `json:"id"`
	ParentId int32 `json:"parent_id"`
	PermissionName string `json:"permission_name"`
	PermissionCode string `json:"permission_code"`
	PermissionPath string `json:"permission_path"`
	RequestParam   string `json:"request_param"`
	Joins string `json:"joins"`
	Sort int32 `json:"sort"`
	Type byte `json:"type"`
	Status byte `json:"status"`
	Remark string `json:"remark"`
	UpdatedAt time.Time `json:"updated_at"`
}

type optionsAdminPermissionReq struct {
	Id int32 `json:"id"`
	ParentId int32 `json:"parent_id"`
}



/**
 * @api {post} /v1/admin_permission  创建权限
 * @apiVersion 0.1.0
 * @apiName  创建
 * @apiGroup 权限列表 AdminPermission
 * @apiParam {Integer} parent_id    	* 父级Id 	{ 0:顶级 }
 * @apiParam {String}  permission_name	* 权限名称 	{ 2 - 100个字符 }
 * @apiParam {String}  permission_code	* 权限路由限制标识 	{ admin_permission }
 * @apiParam {String}  permission_path	* 权限路由限制标识 	{ --- }
 * @apiParam {String}  request_param	* 请求方式 {get, post, put ,delete, patch, options}
 * @apiParam {Integer} sort			    * 排序
 * @apiParam {Integer} type			    * 列表展示类型 { 1：菜单 2：路由 3: 按钮}
 * @apiParam {Integer} status			* 状态 { 1：显示 2：隐藏, 默认：显示 }
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
func (*AdminPermission) Post (req *ghttp.Request)  {
	var add model.AdminPermission

	if err := req.Parse(&add); err != nil {
		response.Json(req, errcode.ErrCodeAdminPermissionAddError, "")
	}
	if len(add.PermissionName) < 2 || len(add.PermissionName) > 100 {
		response.Json(req, errcode.ErrCodeAdminPermissionError, "")
	}
	if add.ParentId <= 0 {
		response.Json(req, errcode.ErrCodeAdminPermissionParentIs, "")
	} else {
		parent, err := server.ModelAdminPermission.GetById(add.ParentId)
		if err != nil || parent == nil {
			response.Json(req, errcode.ErrCodeAdminPermissionParentIs, "")
			return
		}
		tempParent := parent.Map()
		if len(tempParent["joins"].(string)) > 0 {
			add.Joins = tempParent["joins"].(string) + "," + gconv.String(add.ParentId)
		} else {
			add.Joins = gconv.String(add.ParentId)
		}
	}
	self := server.ModelAdminPermission.GetByPermissionName(add.PermissionName)
	if self == false {
		response.Json(req, errcode.ErrCodeAdminPermissionIsAlready, "")
	}
	if add.Type == 0 {
		response.Json(req, errcode.ErrCodeAdminPermissionTypeIs, "")
	}
	if add.Status == 0 {
		add.Status = server.ADMIN_PERMISSION_STATUS_SHOW
	}
	add.CreatedIp = req.GetClientIp()
	add.CreatedAt = time.Now()
	add.UpdatedAt = time.Now()
	data := help.Filter(add)
	if data == nil {
		response.Json(req, errcode.ErrCodeAdminPermissionAddError, "")
	}

	result, err := server.ModelAdminPermission.Create(add)
	if err != nil {
		response.Json(req, errcode.ErrCodeAdminPermissionAddError, "")
	}
	log, _ := json.Marshal(&add)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Level  = server.ADMIN_LOG_LEVEL_WARNING
		options.Action = server.ADMIN_LOG_ACTION_CREATE
		options.Title  = env.F[env.ADMIN_MODULE_PERMISSION]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess, "", result)

}




/**
 * @api {put} /v1/admin_permission  更新权限
 * @apiVersion 0.1.0
 * @apiName  更新
 * @apiGroup 权限列表 AdminPermission
 * @apiParam {Integer} id		 	    * ID
 * @apiParam {Integer} parent_id    	* 父级Id 	{ 0:顶级 }
 * @apiParam {String}  permission_name	* 权限名称 	{ 2 - 100个字符 }
 * @apiParam {String}  permission_code	* 权限路由限制标识 	{ admin_permission }
 * @apiParam {String}  permission_path	* 权限路由限制标识 	{ --- }
 * @apiParam {String}  request_param	* 请求方式 {get, post, put ,delete, patch, options}
 * @apiParam {Integer} sort			    * 排序
 * @apiParam {Integer} type			    * 列表展示类型 { 1：菜单 2：路由 3: 按钮}
 * @apiParam {Integer} status			* 状态 { 1：显示 2：隐藏, 默认：显示 }
 * @apiParam {String}  remark			  备注
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
func (task *AdminPermission) Put (req *ghttp.Request)  {
	var edit putEditAdminPermissionReq
	
	if err := req.Parse(&edit); err != nil {
		response.Json(req, errcode.ErrCodeAdminParseError, "")
	}
	if edit.Id <= 0 {
		response.Json(req, errcode.ErrCodeAdminPermissionEditError, "")
	}
	info, err := server.ModelAdminPermission.GetById(edit.Id)
	if err != nil || info == nil{
		response.Json(req, errcode.ErrCodeAdminPermissionEditError, "")
		return
	}
	
	if len(edit.PermissionName) < 2 || len(edit.PermissionCode) < 2 {
		response.Json(req, errcode.ErrCodeAdminPermissionError, "")
	}
	if edit.ParentId <= 0 {
		response.Json(req, errcode.ErrCodeAdminPermissionParentIs, "")
	} else {
		parent, err := server.ModelAdminPermission.GetById(edit.ParentId)
		if err != nil || parent == nil {
			response.Json(req, errcode.ErrCodeAdminPermissionParentIs, "")
			return
		}
		tempParent := parent.Map()
		if len(tempParent["joins"].(string)) > 0 {
			edit.Joins = tempParent["joins"].(string) + "," + gconv.String(edit.ParentId)
		} else {
			edit.Joins = gconv.String(edit.ParentId)
		}
	}
	var tempModelAdminPermission model.AdminPermission
	_ = info.Struct(&tempModelAdminPermission)
	permission_status := server.ModelAdminPermission.GetByPermissionName(edit.PermissionName)
	if permission_status == false && tempModelAdminPermission.PermissionName != edit.PermissionName {
		response.Json(req, errcode.ErrCodeAdminPermissionIsAlready, "")
	}
	if edit.Type == 0 {
		response.Json(req, errcode.ErrCodeAdminPermissionTypeIs, "")
	}
	edit.UpdatedAt = time.Now()
	data := help.Filter(edit)

	status, err := server.ModelAdminPermission.Update(edit.Id, data)
	if err != nil {

		response.Json(req, errcode.ErrCodeAdminRoleEditError, "")
	} else {
		// if edit.Status > 0 && edit.Status != tempModelAdminPermission.Status || edit.PermissionCode != tempModelAdminPermission.PermissionCode ||  edit.RequestParam != tempModelAdminPermission.RequestParam {
		if edit.Status > 0 {
			// 删除所有redis权限
			_, _ = g.Redis().Do("DEL", redis.ADMIN_HASH_ROLE_PERMISSION_AUTH)
		}
	}
	log, _ := json.Marshal(&edit)
	server.ModelAdminLog.NewAdminLogOption(func(options *server.AdminLogOptions) {
		options.Level  = server.ADMIN_LOG_LEVEL_WARNING
		options.Action = server.ADMIN_LOG_ACTION_UPDATE
		options.Title  = env.F[env.ADMIN_MODULE_PERMISSION]
		options.Description = string(log)
		options.ActionAdminId = Admins.Id
		options.ActionAdminName = Admins.Account
		options.ActionAdminIp = req.GetClientIp()
	})
	response.Json(req, errcode.ErrCodeSuccess, "", status)

}


/**
 * @api {get} /v1/admin_permission  权限选项
 * @apiVersion 0.1.0
 * @apiName  选项
 * @apiGroup 权限列表 AdminPermission
 * @apiParam {Integer} id		 	     查询直属下级 {优先级别高于parent_id}
 * @apiParam {Integer} parent_id		 查询所有下级
 * @apiSuccess {Integer}   code   标识码 200：成功
 * @apiSuccess {Object}    data   数据
 * @apiSuccess {String}    msg    提示信息
 * @apiSuccessExample Success-Response:
 * {
		"code": 200,
		"data": null,
		"remark" : {
		Id             int32     `plat:"primary_key;id" json:"id"`
		ParentId       int32     `plat:"parent_id" json:"parent_id"`             // 上级id
		Joins          string    `plat:"joins" json:"joins"`                     // id路径
		PermissionName string    `plat:"permission_name" json:"permission_name"` // 权限名称
		PermissionCode string    `plat:"permission_code" json:"permission_code"` // 权限code
		PermissionPath string    `plat:"permission_path" json:"permission_path"` // 前端木板路径
		RequestParam   string    `plat:"request_param" json:"request_param"`     // 请求方法:get,post,put,patch,options
		Sort           int32     `plat:"sort" json:"sort"`                       // 排序
		Type           byte      `plat:"type" json:"type"`                       // 菜单类型： 1：菜单 2：路由 3：按钮
		Status         byte      `plat:"status" json:"status"`                   // 状态1：显示 2：隐藏
		CreatedAt      time.Time `plat:"created_at" json:"created_at"`           // 创建时间
		UpdatedAt      time.Time `plat:"updated_at" json:"updated_at"`           // 更新时间
		CreatedIp      string    `plat:"created_ip" json:"created_ip"`           // 创建者Ip
		}
		"msg": "成功"
	}
 * @apiErrorExample Error-Response:
 *  {
 *     "code": 201,
 *     "data": null
 *     "msg": "失败提示",
 *  }
*/

func (*AdminPermission) Get (req *ghttp.Request)  {
	var options optionsAdminPermissionReq
	if err := req.Parse(&options); err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
		return
	}
	where := g.Map{}
	if options.Id > 0 {
		where["parent_id"] = options.Id
	} else if options.ParentId > 0 {
		where["FIND_IN_SET(1,`joins`)"] = nil
	}
	roles, err := server.ModelAdminPermission.Options(where)
	if err != nil {
		response.Json(req, errcode.ErrCodeFailure, "")
		return
	}
	response.Json(req, errcode.ErrCodeSuccess, "", roles)

}
