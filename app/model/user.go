package model

import "time"

type User struct {
	Id                   int32     `plat:"primary_key;id" json:"id"`                               // 用户id
	Username             string    `plat:"username" json:"username"`                               // 用户名
	Nickname             string    `plat:"nickname" json:"nickname"`                               // 昵称
	Password             string    `plat:"password" json:"password"`                               // 用户密码
	WithdrawPassword     string    `plat:"withdraw_password" json:"withdraw_password"`             // 提现密码
	ParentId             int32     `plat:"parent_id" json:"parent_id"`                             // 上级id
	AgentJoin            string    `plat:"agent_join" json:"agent_join"`                           // 代理线
	RealName             string    `plat:"real_name" json:"real_name"`                             // 真实姓名
	Phone                string    `plat:"phone" json:"phone"`                                     // 手机号
	Balance              int32     `plat:"balance" json:"balance"`                                 // 发布余额
	Commission           int32     `plat:"commission" json:"commission"`                           // 佣金
	Avatar               string    `plat:"avatar" json:"avatar"`                                   // 头像链接
	CreatedAt            time.Time `plat:"created_at" json:"created_at"`                           // 创建时间
	UpdatedAt            time.Time `plat:"updated_at" json:"updated_at"`                           // 更新时间
	CreatedIp            string    `plat:"created_ip" json:"created_ip"`                           // 注册ip
	LastLoginIp          string    `plat:"last_login_ip" json:"last_login_ip"`                     // 最后登录ip
	LastLoginTime        time.Time `plat:"last_login_time" json:"last_login_time"`                 // 最后登录时间
	LoginCount           int32     `plat:"login_count" json:"login_count"`                         // 登陆次数
	PublishStatus        int32     `plat:"publish_status" json:"publish_status"`                   // 发布任务限制时间  1：正常; 其他：异常限制
	SubscribeStatus      int32     `plat:"subscribe_status" json:"subscribe_status"`               // 接受任务限制时间  1：正常; 其他：异常限制
	WithdrawStatus       int32     `plat:"withdraw_status" json:"withdraw_status"`                 // 提现限制时间  1：正常; 其他：异常限制
	MessageStatus        int32     `plat:"message_status" json:"message_status"`                   // 发送消息限制时间  1：正常; 其他：异常限制
	LoginStatus          int32     `plat:"login_status" json:"login_status"`                       // 登陆限制时间  1：正常; 其他：异常限制
	LastActionStatusTime time.Time `plat:"last_action_status_time" json:"last_action_status_time"` // 标记状态改动时的生效时间
	Remark               string    `plat:"remark" json:"remark"`                                   // 备注
}

func (*User) TableName() string {
	return "user"
}
