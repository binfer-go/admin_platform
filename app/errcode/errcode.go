package errcode

type ErrCode int32

const (
	ErrCodeSuccess                      ErrCode = 200
	ErrCodeFailure                      ErrCode = 201
	ErrCodeInvalidToken                 ErrCode = 202
	ErrCodeInvalidParam                 ErrCode = 203
	ErrCodeRequestFrequently            ErrCode = 204
	ErrCodeInvalidSMSCode               ErrCode = 205
	ErrCodeCodeExpire                   ErrCode = 206
	ErrCodeUserAlreadyExist             ErrCode = 207
	ErrCodeInvalidPassword              ErrCode = 208
	ErrCodeUserNotExist                 ErrCode = 209
	ErrCodeTaskPubOrderNotExist         ErrCode = 210
	ErrCodeTaskPubOrderExpiration       ErrCode = 211
	ErrCodeTaskOrderAlreadyExist        ErrCode = 212
	ErrCodeTimeError                    ErrCode = 213
	ErrCodeCreateTaskError              ErrCode = 214
	ErrCodeUpdateTaskError              ErrCode = 215
	ErrCodeUpdateTaskNotExist           ErrCode = 216
	ErrCodeCreateAdminError             ErrCode = 217
	ErrCodeUpdateAdminError             ErrCode = 218
	ErrCodeAdminNotExist                ErrCode = 219
	ErrCodeAdminAlreadyExist            ErrCode = 220
	ErrCodeLoginError                   ErrCode = 221
	ErrCodeLoginStatusError             ErrCode = 222
	ErrCodeAdminAccountLimitError       ErrCode = 223
	ErrCodeAdminPasswordLimitError      ErrCode = 224
	ErrCodePublishPassError             ErrCode = 225
	ErrCodeSubscribePassError           ErrCode = 226
	ErrCodeOrderTaskLockError           ErrCode = 227
	ErrCodeUserUpdateError              ErrCode = 228
	ErrCodeAdminRoleError               ErrCode = 229
	ErrCodeAdminRoleAddError            ErrCode = 230
	ErrCodeAdminRoleEditError           ErrCode = 231
	ErrCodeAdminRoleIsAlready           ErrCode = 232
	ErrCodeAdminRoleNotError            ErrCode = 233
	ErrCodeAdminPermissionError         ErrCode = 234
	ErrCodeAdminPermissionAddError      ErrCode = 235
	ErrCodeAdminPermissionEditError     ErrCode = 236
	ErrCodeAdminPermissionIsAlready     ErrCode = 237
	ErrCodeAdminPermissionParentIs      ErrCode = 238
	ErrCodeAdminPermissionTypeIs        ErrCode = 239
	ErrCodeAdminRolePermissionBindError ErrCode = 240
	ErrCodeAdminRolePermissionRoleId    ErrCode = 241
	ErrCodeAdminRolePermissionId        ErrCode = 242
	ErrCodeApiRouteAuthError            ErrCode = 243
	ErrCodeUserBankNotExist             ErrCode = 244
	ErrCodeUserBankUpdateError          ErrCode = 245
	ErrCodeAdminParseError              ErrCode = 246
	ErrCodeAdminBindPermissionError     ErrCode = 247
	ErrCodeAdminMasterBindError         ErrCode = 248
	ErrCodeAdminDepositNotExist         ErrCode = 249
	ErrCodeAdminWithDrawNotExist        ErrCode = 250
	ErrCodeUploadError                  ErrCode = 251
)

func (code ErrCode) String() string {
	switch code {
	case ErrCodeSuccess:
		return "成功"
	case ErrCodeFailure:
		return "系统错误"
	case ErrCodeInvalidToken:
		return "无效的Token"
	case ErrCodeInvalidParam:
		return "参数非法"
	case ErrCodeRequestFrequently:
		return "请求过于频繁,请稍后再试"
	case ErrCodeInvalidSMSCode:
		return "验证码错误"
	case ErrCodeCodeExpire:
		return "验证码已过期"
	case ErrCodeUserAlreadyExist:
		return "用户已存在"
	case ErrCodeInvalidPassword:
		return "密码错误"
	case ErrCodeUserNotExist:
		return "用户不存在"
	case ErrCodeTaskPubOrderNotExist:
		return "任务订单不存在"
	case ErrCodeTaskPubOrderExpiration:
		return "任务订单已失效"
	case ErrCodeTaskOrderAlreadyExist:
		return "任务订单已存在"
	case ErrCodeTimeError:
		return "时间格式非法"
	case ErrCodeCreateTaskError:
		return "创建任务失败"
	case ErrCodeUpdateTaskError:
		return "更新任务失败"
	case ErrCodeUpdateTaskNotExist:
		return "任务不存在"
	case ErrCodeCreateAdminError:
		return "创建管理员失败"
	case ErrCodeUpdateAdminError:
		return "更新管理员失败"
	case ErrCodeAdminNotExist:
		return "管理员不存在"
	case ErrCodeAdminAlreadyExist:
		return "管理员已存在"
	case ErrCodeLoginError:
		return "登陆失败"
	case ErrCodeLoginStatusError:
		return "账户已禁用， 请联系管理员"
	case ErrCodeAdminAccountLimitError:
		return "账户限制5-40个字符"
	case ErrCodeAdminPasswordLimitError:
		return "密码限制5-40个字符"
	case ErrCodePublishPassError:
		return "发布任务不可修改"
	case ErrCodeSubscribePassError:
		return "接单任务不可修改"
	case ErrCodeOrderTaskLockError:
		return "订单任务处于锁定状态"
	case ErrCodeUserUpdateError:
		return "会员更新失败"
	case ErrCodeAdminRoleError:
		return "管理角色名称限制2-40个字符"
	case ErrCodeAdminRoleAddError:
		return "管理角色创建失败"
	case ErrCodeAdminRoleEditError:
		return "管理角色更新失败"
	case ErrCodeAdminRoleIsAlready:
		return "管理角色名称已经存在"
	case ErrCodeAdminRoleNotError:
		return "管理角色不存在"
	case ErrCodeAdminPermissionError:
		return "权限名称限制2-100个字符"
	case ErrCodeAdminPermissionAddError:
		return "权限创建失败"
	case ErrCodeAdminPermissionEditError:
		return "权限更新失败"
	case ErrCodeAdminPermissionIsAlready:
		return "权限名称已经存在"
	case ErrCodeAdminPermissionParentIs:
		return "请选择一个父级模块"
	case ErrCodeAdminPermissionTypeIs:
		return "请选择目前支持的展示类型"
	case ErrCodeAdminRolePermissionBindError:
		return "绑定权限失败"
	case ErrCodeAdminRolePermissionRoleId:
		return "角色ID非法"
	case ErrCodeAdminRolePermissionId:
		return "绑定权限信息非法"
	case ErrCodeApiRouteAuthError:
		return "无权限访问"
	case ErrCodeUserBankNotExist:
		return "会员银行卡不存在"
	case ErrCodeUserBankUpdateError:
		return "会员银行卡更新失败"
	case ErrCodeAdminParseError:
		return "数据解析失败"
	case ErrCodeAdminBindPermissionError:
		return "角色尚未绑定权限"
	case ErrCodeAdminMasterBindError:
		return "当前不允许绑定超级管理员"
	case ErrCodeAdminDepositNotExist:
		return "存款订单不存在"
	case ErrCodeAdminWithDrawNotExist:
		return "取款订单不存在"
	case ErrCodeUploadError:
		return "文件上传失败"
	default:
		return "系统繁忙"
	}
}

func Code(err error) ErrCode {
	switch err {
	case Success:
		return ErrCodeSuccess
	case Failure:
		return ErrCodeFailure
	case InvalidToken:
		return ErrCodeInvalidToken
	case InvalidParam:
		return ErrCodeInvalidParam
	case RequestFrequently:
		return ErrCodeRequestFrequently
	case InvalidSMSCode:
		return ErrCodeInvalidSMSCode
	case CodeExpire:
		return ErrCodeCodeExpire
	case UserAlreadyExist:
		return ErrCodeUserAlreadyExist
	case InvalidPassword:
		return ErrCodeInvalidPassword
	case UserNotExist:
		return ErrCodeUserNotExist
	case TaskPubOrderNotExist:
		return ErrCodeTaskPubOrderNotExist
	case TaskPubOrderExpiration:
		return ErrCodeTaskPubOrderExpiration
	case TaskOrderAlreadyExist:
		return ErrCodeTaskOrderAlreadyExist
	case TimeError:
		return ErrCodeTimeError
	case CreateTaskError:
		return ErrCodeCreateTaskError
	case UpdateTaskError:
		return ErrCodeUpdateTaskError
	case UpdateTaskNotExist:
		return ErrCodeUpdateTaskNotExist
	case CreateAdminError:
		return ErrCodeCreateAdminError
	case UpdateAdminError:
		return ErrCodeUpdateAdminError
	case AdminNotExist:
		return ErrCodeAdminNotExist
	case AdminAlreadyExist:
		return ErrCodeAdminAlreadyExist
	case LoginError:
		return ErrCodeLoginError
	case LoginStatusError:
		return ErrCodeLoginStatusError
	case AdminAccountLimitError:
		return ErrCodeAdminAccountLimitError
	case AdminPasswordLimitError:
		return ErrCodeAdminPasswordLimitError
	case PublishPassError:
		return ErrCodePublishPassError
	case SubscribePassError:
		return ErrCodeSubscribePassError
	case OrderTaskLockError:
		return ErrCodeOrderTaskLockError
	case UserUpdateError:
		return ErrCodeUserUpdateError
	case AdminRoleError:
		return ErrCodeAdminRoleError
	case AdminRoleAddError:
		return ErrCodeAdminRoleAddError
	case AdminRoleEditError:
		return ErrCodeAdminRoleEditError
	case AdminRoleIsAlready:
		return ErrCodeAdminRoleIsAlready
	case AdminRoleNotError:
		return ErrCodeAdminRoleNotError
	case AdminPermissionError:
		return ErrCodeAdminPermissionError
	case AdminPermissionAddError:
		return ErrCodeAdminPermissionAddError
	case AdminPermissionEditError:
		return ErrCodeAdminPermissionEditError
	case AdminPermissionIsAlready:
		return ErrCodeAdminPermissionIsAlready
	case AdminPermissionParentIs:
		return ErrCodeAdminPermissionParentIs
	case AdminPermissionTypeIs:
		return ErrCodeAdminPermissionTypeIs
	case AdminRolePermissionBindError:
		return ErrCodeAdminRolePermissionBindError
	case AdminRolePermissionRoleId:
		return ErrCodeAdminRolePermissionRoleId
	case AdminRolePermissionId:
		return ErrCodeAdminRolePermissionId
	case ApiRouteAuthError:
		return ErrCodeApiRouteAuthError
	case UserBankNotExist:
		return ErrCodeUserBankNotExist
	case UserBankUpdateError:
		return ErrCodeUserBankUpdateError
	case AdminParseError:
		return ErrCodeAdminParseError
	case AdminBindPermissionError:
		return ErrCodeAdminBindPermissionError
	case AdminMasterBindError:
		return ErrCodeAdminMasterBindError
	case AdminDepositNotExist:
		return ErrCodeAdminDepositNotExist
	case AdminWithDrawNotExist:
		return ErrCodeAdminWithDrawNotExist
	case UploadError:
		return ErrCodeUploadError
	default:
		return -1
	}
}
