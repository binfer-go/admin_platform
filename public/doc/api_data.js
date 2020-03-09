define({ "api": [
  {
    "type": "get",
    "url": "/v1/task",
    "title": "任务类型列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "任务类型_Task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id查询详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>标题</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {config: task_status}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId        int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tTitle     string    `plat:\"title\" json:\"title\"`           // 任务标题\n\t\tDescribe  string    `plat:\"describe\" json:\"describe\"`     // 任务描述\n\t\tStatus    byte      `plat:\"status\" json:\"status\"`         // 1:启用 2:禁用\n\t\tSort      int32     `plat:\"sort\" json:\"sort\"`             // 排序\n\t\tCreatedAt time.Time `plat:\"created_at\" json:\"created_at\"` // 创建时间\n\t\tUpdatedAt time.Time `plat:\"updated_at\" json:\"updated_at\"` // 更新时间\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\t\t#总页数\n\t\t\t\"TotalSize\": 1,\t\t#总条数\n\t\t\t\"CurrentPage\": 1,\t#当前页码\n\t\t\t\"PageBarNum\": 10\t#分页标识\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task.go",
    "groupTitle": "任务类型_Task"
  },
  {
    "type": "put",
    "url": "/v1/task",
    "title": "更新任务类型",
    "version": "0.1.0",
    "name": "更新",
    "group": "任务类型_Task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>任务Id</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>标题</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "describe",
            "description": "<p>描述</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "sort",
            "description": "<p>排序</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 0：启用 1：禁用</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task.go",
    "groupTitle": "任务类型_Task"
  },
  {
    "type": "post",
    "url": "/v1/task",
    "title": "创建任务类型",
    "version": "0.1.0",
    "name": "添加",
    "group": "任务类型_Task",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>标题</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "describe",
            "description": "<p>描述</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "sort",
            "description": "<p>排序</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 0：启用 1：禁用</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1000000006,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task.go",
    "groupTitle": "任务类型_Task"
  },
  {
    "type": "get",
    "url": "/v1/user_deposit",
    "title": "会员取款列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "会员取款_Withdraw",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id查询详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "username",
            "description": "<p>用户名</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "phone",
            "description": "<p>手机号</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "admin_account",
            "description": "<p>操作人</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {1：提现中 2：审核中 3：成功 4：拒绝} {config: user_withdraw_status}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId           int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tUserId       int32     `plat:\"user_id\" json:\"user_id\"`             // 用户ID\n\t\tUsername     string    `plat:\"username\" json:\"username\"`           // 用户名\n\t\tPhone        string    `plat:\"phone\" json:\"phone\"`                 // 电话\n\t\tAmount       int32     `plat:\"amount\" json:\"amount\"`               // 提现金额\n\t\tBankId       int64     `plat:\"bank_id\" json:\"bank_id\"`             // 银行卡卡号\n\t\tBankName     string    `plat:\"bank_name\" json:\"bank_name\"`         // 银行名字\n\t\tStatus       byte      `plat:\"status\" json:\"status\"`               // 状态：1：提现中 2：审核中 3：成功 4：拒绝\n\t\tAdminAccount string    `plat:\"admin_account\" json:\"admin_account\"` // 操作人账号\n\t\tCreatedAt    time.Time `plat:\"created_at\" json:\"created_at\"`       // 创建时间\n\t\tUpdatedAt    time.Time `plat:\"updated_at\" json:\"updated_at\"`       // 变更时间\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user_withdraw.go",
    "groupTitle": "会员取款_Withdraw"
  },
  {
    "type": "put",
    "url": "/v1/user_deposit",
    "title": "更新会员取款信息",
    "version": "0.1.0",
    "name": "更新",
    "group": "会员取款_Withdraw",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>存款Id</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {3：成功 4：拒绝}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user_withdraw.go",
    "groupTitle": "会员取款_Withdraw"
  },
  {
    "type": "get",
    "url": "/v1/user_deposit",
    "title": "会员存款列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "会员存款_Deposit",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id查询详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "username",
            "description": "<p>用户名</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "phone",
            "description": "<p>手机号</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "admin_account",
            "description": "<p>操作人</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {1：提现中 2：审核中 3：成功 4：拒绝} {config: user_deposit_status}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId           int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tUserId       int32     `plat:\"user_id\" json:\"user_id\"`             // 用户ID\n\t\tUsername     string    `plat:\"username\" json:\"username\"`           // 用户名\n\t\tPhone        string    `plat:\"phone\" json:\"phone\"`                 // 电话\n\t\tPayType      byte      `plat:\"pay_type\" json:\"pay_type\"`           // 1:支付宝 2:微信 3:银行卡转账\n\t\tAmount       int32     `plat:\"amount\" json:\"amount\"`               // 交易金额\n\t\tRealAmount   int32     `plat:\"real_amount\" json:\"real_amount\"`     // 实际到账金额\n\t\tBankId       int32     `plat:\"bank_id\" json:\"bank_id\"`             // 用户银行卡ID(备用)\n\t\tBankName     string    `plat:\"bank_name\" json:\"bank_name\"`         // 用户银行卡名称(备用)\n\t\tStatus       byte      `plat:\"status\" json:\"status\"`               // 1:等待支付 2:成功 3:失败 4:待人工审核\n\t\tAdminAccount string    `plat:\"admin_account\" json:\"admin_account\"` // 操作人账号\n\t\tCreatedAt    time.Time `plat:\"created_at\" json:\"created_at\"`       // 创建时间\n\t\tUpdatedAt    time.Time `plat:\"updated_at\" json:\"updated_at\"`       // 变动时间\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user_deposit.go",
    "groupTitle": "会员存款_Deposit"
  },
  {
    "type": "put",
    "url": "/v1/user_deposit",
    "title": "更新会员存款信息",
    "version": "0.1.0",
    "name": "更新",
    "group": "会员存款_Deposit",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>存款Id</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {3：成功 4：拒绝}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user_deposit.go",
    "groupTitle": "会员存款_Deposit"
  },
  {
    "type": "get",
    "url": "/v1/user",
    "title": "会员列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "会员管理_User",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id查询详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "username",
            "description": "<p>会员账户</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "phone",
            "description": "<p>电话</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "real_name",
            "description": "<p>真实姓名</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "reg_ip",
            "description": "<p>注册IP</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {1：启用 2：禁用} {config: user_status}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId               int32     `plat:\"primary_key;id\" json:\"id\"`                   // 用户id\n\t\tUsername         string    `plat:\"username\" json:\"username\"`                   // 用户名\n\t\tNickname         string    `plat:\"nickname\" json:\"nickname\"`                   // 昵称\n\t\tPassword         string    `plat:\"password\" json:\"password\"`                   // 用户密码\n\t\tWithdrawPassword string    `plat:\"withdraw_password\" json:\"withdraw_password\"` // 提现密码\n\t\tParentId         int32     `plat:\"parent_id\" json:\"parent_id\"`                 // 上级id\n\t\tAgentJoin        string    `plat:\"agent_join\" json:\"agent_join\"`               // 代理线\n\t\tRealName         string    `plat:\"real_name\" json:\"real_name\"`                 // 真实姓名\n\t\tPhone            string    `plat:\"phone\" json:\"phone\"`                         // 手机号\n\t\tBalance          int32     `plat:\"balance\" json:\"balance\"`                     // 发布余额\n\t\tCommission       int32     `plat:\"commission\" json:\"commission\"`               // 佣金\n\t\tAvatar           string    `plat:\"avatar\" json:\"avatar\"`                       // 头像链接\n\t\tCreatedAt        time.Time `plat:\"created_at\" json:\"created_at\"`               // 创建时间\n\t\tUpdatedAt        time.Time `plat:\"updated_at\" json:\"updated_at\"`               // 更新时间\n\t\tCreatedIp        string    `plat:\"created_ip\" json:\"created_ip\"`               // 注册ip\n\t\tLastLoginIp      string    `plat:\"last_login_ip\" json:\"last_login_ip\"`         // 最后登录ip\n\t\tLastLoginTime    time.Time `plat:\"last_login_time\" json:\"last_login_time\"`     // 最后登录时间\n\t\tLoginCount       int32     `plat:\"login_count\" json:\"login_count\"`             // 登陆次数\n\t\tStatus           byte      `plat:\"status\" json:\"status\"`                       // 1:启用 2:禁用\n\t\tRemark           string    `plat:\"remark\" json:\"remark\"`                       // 备注\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user.go",
    "groupTitle": "会员管理_User"
  },
  {
    "type": "get",
    "url": "/v1/user_info",
    "title": "会员组合信息",
    "version": "0.1.0",
    "name": "报表",
    "group": "会员管理_User",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "user_id",
            "description": "<ul> <li>会员id</li> </ul>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId                       int32     `plat:\"primary_key;id\" json:\"id\"`                                         // 用户数据累计表\n\t\tUserId                   int32     `plat:\"user_id\" json:\"user_id\"`                                           // 用户id\n\t\tUserParentId             int32     `plat:\"user_parent_id\" json:\"user_parent_id\"`                             // 直属上级\n\t\tPhone                    string    `plat:\"phone\" json:\"phone\"`                                               // 用户电话\n\t\tUsername                 string    `plat:\"username\" json:\"username\"`                                         // 用户名\n\t\tUserChildrerCount        int32     `plat:\"user_childrer_count\" json:\"user_childrer_count\"`                   // 下级会员个数\n\t\tTaskPubCount             int32     `plat:\"task_pub_count\" json:\"task_pub_count\"`                             // 发布任务数\n\t\tTaskPubChildrerCount     int32     `plat:\"task_pub_childrer_count\" json:\"task_pub_childrer_count\"`           // 发布任务量(子任务)\n\t\tTaskPubEndCount          int32     `plat:\"task_pub_end_count\" json:\"task_pub_end_count\"`                     // 结束的发布任务数\n\t\tTaskPubEndChildrerCount  int32     `plat:\"task_pub_end_childrer_count\" json:\"task_pub_end_childrer_count\"`   // 结束的发布任务量\n\t\tTaskPubWaitCount         int32     `plat:\"task_pub_wait_count\" json:\"task_pub_wait_count\"`                   // 进行中的发布任务数\n\t\tTaskPubWaitChildrerCount int32     `plat:\"task_pub_wait_childrer_count\" json:\"task_pub_wait_childrer_count\"` // 进行中的任务发布量\n\t\tTaskSubWaitCount         int32     `plat:\"task_sub_wait_count\" json:\"task_sub_wait_count\"`                   // 进行中的接单数\n\t\tTaskSubEndCount          int32     `plat:\"task_sub_end_count\" json:\"task_sub_end_count\"`                     // 已完成的接单数\n\t\tComissionTaskSum         int32     `plat:\"comission_task_sum\" json:\"comission_task_sum\"`                     // 佣金(任务佣金)\n\t\tComissionPromotionSum    int32     `plat:\"comission_promotion_sum\" json:\"comission_promotion_sum\"`           // 佣金(推广佣金)\n\t\tWithdrawTaskSum          int32     `plat:\"withdraw_task_sum\" json:\"withdraw_task_sum\"`                       // 提现(任务钱包提现)\n\t\tWithdrawMasterSum        int32     `plat:\"withdraw_master_sum\" json:\"withdraw_master_sum\"`                   // 提现(主钱包提现)\n\t\tDepositTaskSum           int32     `plat:\"deposit_task_sum\" json:\"deposit_task_sum\"`                         // 任务钱包收益\n\t\tDepositMasterSum         int32     `plat:\"deposit_master_sum\" json:\"deposit_master_sum\"`                     // 主钱包收益\n\t\tLoginCount               int32     `plat:\"login_count\" json:\"login_count\"`                                   // 累计登陆次数\n\t\tCreatedAt                time.Time `plat:\"created_at\" json:\"created_at\"`                                     // 注册时间\n\t\tUpdatedAt                time.Time `plat:\"updated_at\" json:\"updated_at\"`                                     // 最后更新时间\n\t\tPublishStatus    \t\t int32     `plat:\"publish_status\" json:\"publish_status\"`       // 发布任务限制时间  1：正常; 其他：异常限制\n\t\tSubscribeStatus  \t\t int32     `plat:\"subscribe_status\" json:\"subscribe_status\"`   // 接受任务限制时间  1：正常; 其他：异常限制\n\t\tWithdrawStatus   \t\t int32     `plat:\"withdraw_status\" json:\"withdraw_status\"`     // 提现限制时间  1：正常; 其他：异常限制\n\t\tMessageStatus    \t\t int32     `plat:\"message_status\" json:\"message_status\"`       // 发送消息限制时间  1：正常; 其他：异常限制\n\t\tLoginStatus      \t\t int32     `plat:\"login_status\" json:\"login_status\"`           // 登陆限制时间  1：正常; 其他：异常限制\n\t\t},\n\t\t\"msg\": \"成功\",\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user.go",
    "groupTitle": "会员管理_User"
  },
  {
    "type": "get",
    "url": "/v1/user",
    "title": "更新会员信息",
    "version": "0.1.0",
    "name": "更新",
    "group": "会员管理_User",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>ID</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "real_name",
            "description": "<p>真实姓名</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "nick_name",
            "description": "<p>用户昵称</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 \t{ 1：启用 2：禁用 }</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user.go",
    "groupTitle": "会员管理_User"
  },
  {
    "type": "patch",
    "url": "/v1/user",
    "title": "会员状态解、封",
    "version": "0.1.0",
    "name": "状态",
    "group": "会员管理_User",
    "header": {
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "Content-Type",
            "description": "<ul> <li>multipart/form-data</li> </ul>"
          },
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "authorization",
            "description": "<ul> <li>Bearer token</li> </ul>"
          }
        ]
      }
    },
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "user_id",
            "description": "<ul> <li>会员id</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "publish_status",
            "description": "<ul> <li>发布任务限制时间  \t{config: user_action_status}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "subscribe_status",
            "description": "<ul> <li>接受任务限制时间\t{config: user_action_status}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "withdraw_status",
            "description": "<ul> <li>提现限制时间\t\t{config: user_action_status}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "message_status",
            "description": "<ul> <li>发信息限制时间\t\t{config: user_action_status}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "login_status",
            "description": "<ul> <li>登陆限制时间\t\t{config: user_action_status}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "remark",
            "description": "<p>备注</p>"
          },
          {
            "group": "Parameter",
            "type": "File",
            "optional": false,
            "field": "image",
            "description": "<p>上传文件</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "\t{\n    \"api\": 1583482081,\n    \"code\": 200,\n    \"data\": null,\n    \"msg\": \"成功\",\n    \"time\": 1583566273\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user.go",
    "groupTitle": "会员管理_User"
  },
  {
    "type": "get",
    "url": "/v1/user_bank",
    "title": "会员银行卡列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "会员银行卡_UserBank",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id查询详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "phone",
            "description": "<p>电话</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "bank_id",
            "description": "<p>银行id(系统银行列表)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "bank_number",
            "description": "<p>银行卡号</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "real_name",
            "description": "<p>真实姓名</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {1：启用 2：禁用} {config: user_bank_status}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId          int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tUserId      int32     `plat:\"user_id\" json:\"user_id\"`           // 用户ID\n\t\tUsername    string    `plat:\"username\" json:\"username\"`         // 用户名\n\t\tBankId      int32     `plat:\"bank_id\" json:\"bank_id\"`           // 银行id\n\t\tBankName    string    `plat:\"bank_name\" json:\"bank_name\"`       // 银行名\n\t\tBankNumber  string    `plat:\"bank_number\" json:\"bank_number\"`   // 银行卡号\n\t\tRealName    string    `plat:\"real_name\" json:\"real_name\"`       // 持卡人\n\t\tBankAddress string    `plat:\"bank_address\" json:\"bank_address\"` // 银行地址\n\t\tStatus      byte      `plat:\"status\" json:\"status\"`             // 1:启用 2：禁用\n\t\tRemark      string    `plat:\"remark\" json:\"remark\"`             // 备注\n\t\tCreatedAt   time.Time `plat:\"created_at\" json:\"created_at\"`     // 创建时间\n\t\tUpdatedAt   time.Time `plat:\"updated_at\" json:\"updated_at\"`     // 更新时间\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user_bank.go",
    "groupTitle": "会员银行卡_UserBank"
  },
  {
    "type": "get",
    "url": "/v1/user",
    "title": "更新会员银行卡",
    "version": "0.1.0",
    "name": "更新",
    "group": "会员银行卡_UserBank",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>ID</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 \t{ 1：启用 2：禁用 }</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "remark",
            "description": "<p>备注</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/user_bank.go",
    "groupTitle": "会员银行卡_UserBank"
  },
  {
    "type": "get",
    "url": "/v1/task_publish",
    "title": "发布任务列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "发布任务_Publish",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id查询详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>任务状态 {1:待发布 2:待审核 3:已通过 4:已拒绝 5:已关闭 6:已删除} {config: task_publish_status}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId                int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tUserId            int32     `plat:\"user_id\" json:\"user_id\"`                       // 用户ID\n\t\tUsername          string    `plat:\"username\" json:\"username\"`                     // 用户名\n\t\tAvatar            string    `plat:\"avatar\" json:\"avatar\"`                         // 用户头像\n\t\tTaskType          byte      `plat:\"task_type\" json:\"task_type\"`                   // 任务类型ID\n\t\tProject           string    `plat:\"project\" json:\"project\"`                       // 项目名称\n\t\tTitle             string    `plat:\"title\" json:\"title\"`                           // 任务标题\n\t\tDescribe          string    `plat:\"describe\" json:\"describe\"`                     // 任务描述\n\t\tLink              string    `plat:\"link\" json:\"link\"`                             // 任务链接\n\t\tAmount            int32     `plat:\"amount\" json:\"amount\"`                         // 任务金额\n\t\tAccept            int32     `plat:\"accept\" json:\"accept\"`                         // 做单人数\n\t\tCommit            int32     `plat:\"commit\" json:\"commit\"`                         // 待审核人数\n\t\tSuccess           int32     `plat:\"success\" json:\"success\"`                       // 已通过人数\n\t\tCount             int32     `plat:\"count\" json:\"count\"`                           // 任务数量\n\t\tAdminAccount      string    `plat:\"admin_account\" json:\"admin_account\"`           // 操作人账号\n\t\tStep              string    `plat:\"step\" json:\"step\"`                             // 任务步骤\n\t\tStatus            byte      `plat:\"status\" json:\"status\"`                         // 1:待发布 2:待审核3:已通过 4:已拒绝 5:已结束\n\t\tRefuseRemark      string    `plat:\"refuse_remark\" json:\"refuse_remark\"`           // 拒绝原因\n\t\tUnavailableRemark string    `plat:\"unavailable_remark\" json:\"unavailable_remark\"` // 禁用原因\n\t\tExpireTs          int64     `plat:\"expire_ts\" json:\"expire_ts\"`                   // 过期时间\n\t\tInspectTs         int64     `plat:\"inspect_ts\" json:\"inspect_ts\"`                 // 检查时间\n\t\tStartTs           int64     `plat:\"start_ts\" json:\"start_ts\"`                     // 任务开始时间\n\t\tFinishTs          int64     `plat:\"finish_ts\" json:\"finish_ts\"`                   // 任务结束时间\n\t\tCreatedAt         time.Time `plat:\"created_at\" json:\"created_at\"`                 // 创建时间\n\t\tUpdatedAt         time.Time `plat:\"updated_at\" json:\"updated_at\"`                 // 更新时间\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task_publish.go",
    "groupTitle": "发布任务_Publish"
  },
  {
    "type": "put",
    "url": "/v1/task_publish",
    "title": "更新发布任务",
    "version": "0.1.0",
    "name": "更新",
    "group": "发布任务_Publish",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>发布任务Id  - {status==1 or 3，才可以修改}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "project",
            "description": "<p>项目名称</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>标题</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "describe",
            "description": "<p>描述</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "link",
            "description": "<p>url</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "limit_count",
            "description": "<p>任务限制人数</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "count",
            "description": "<p>已领人数</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>任务状态：{1:待发布 2:待审核 3:已通过 4:已拒绝 5:已关闭 6:已删除}</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "expire_ts",
            "description": "<p>过期时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "inspect_ts",
            "description": "<p>检查时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "finish_time",
            "description": "<p>结束时间</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task_publish.go",
    "groupTitle": "发布任务_Publish"
  },
  {
    "type": "patch",
    "url": "/v1/task_publish",
    "title": "锁定/解锁发布任务",
    "version": "0.1.0",
    "name": "行为",
    "group": "发布任务_Publish",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>任务Id</li> </ul>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task_publish.go",
    "groupTitle": "发布任务_Publish"
  },
  {
    "type": "get",
    "url": "/v1/report_dashboards",
    "title": "控制台数据看板",
    "version": "0.1.0",
    "name": "报表",
    "group": "报表管理_Report",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": " {\n\t\"code\": 200,\n\t\"data\": {\n\t\"report_user\": {\n\t\t\"user_report_total\": 6, \t# {Integer}\t会员数\n\t\t\"user_online\": 0, \t\t# {Integer}\t在线人数\n\t\t\"user_today_register\": 0, \t# {Integer}\t今日注册人数\n\t\t\"user_yestoday_register\": 0\t# {Integer}\t昨日注册人数\n\t},\n\t\"report_publish\": {\n\t\t\"task_publish_total\": 1,\t\t# {Integer}\t任务总数/8963\n\t\t\"task_publish_child_total\": 5,\t\t# {Integer}\t56/任务子集总数\n\t\t\"task_today_publish_total\": 0,\t\t# {Integer}\t今日任务总数/546\n\t\t\"task_today_publish_child_total\": 0,\t# {Integer}\t6/今日任务子集总数\n\t\t\"task_yestoday_publish_total\": 0,\t# {Integer}\t昨日任务总数/998\n\t\t\"task_yestoday_publish_child_total\": 0,\t# {Integer}\t9/昨日任务子集总数\n\t\t\"task_persion_pulbish_total\": 1\t\t# {Integer}\t发布人数\n\t},\n\t\"report_subscribe\": {\n\t\t\"task_subscribe_total\": 0,\t\t# {Integer}\t完成量\n\t\t\"task_today_subscribe\": 0,\t\t# {Integer}\t今日完成量\n\t\t\"task_yestoday_subscribe\": 0,\t\t# {Integer}\t昨日完成量\n\t\t\"task_current_valid_total\": 3\t\t# {Integer}\t当前剩余任务数\n\t},\n\t\"report_user_money\": {\n\t\t\"money_user_balance_total\": 0,\t\t# {Float64}\t会员累计金额\n\t\t\"money_today_deposit_money\": 0,\t\t# {Float64}\t会员今日存款\n\t\t\"money_today_commission_money\": 0,\t# {Float64}\t会员今日佣金\n\t\t\"money_today_withdraw_money\": 0\t\t# {Float64}\t会员今日取款\n\t}\n \t},\n\t\"msg\": \"成功\"\n }",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n    \"code\": 201,\n    \"data\": null\n    \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/report/report_dashboard.go",
    "groupTitle": "报表管理_Report"
  },
  {
    "type": "get",
    "url": "/v1/task_subscribe",
    "title": "接单任务列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "接单任务_Subscribe",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id查询详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>任务状态：{ 1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:复审失败 7:已过期} {config: task_subscribe_status}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId              int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tTaskId          int32     `plat:\"task_id\" json:\"task_id\"`                   // 任务id\n\t\tTaskType        byte      `plat:\"task_type\" json:\"task_type\"`               // 任务类型\n\t\tProject         string    `plat:\"project\" json:\"project\"`                   // 项目名称\n\t\tMerchantId      int32     `plat:\"merchant_id\" json:\"merchant_id\"`           // 卖家ID\n\t\tMerchantName    string    `plat:\"merchant_name\" json:\"merchant_name\"`       // 卖家账号\n\t\tMerchantAvatar  string    `plat:\"merchant_avatar\" json:\"merchant_avatar\"`   // 卖家头像\n\t\tUserId          int32     `plat:\"user_id\" json:\"user_id\"`                   // 买家ID\n\t\tUserName        string    `plat:\"user_name\" json:\"user_name\"`               // 买家账号\n\t\tAmount          int32     `plat:\"amount\" json:\"amount\"`                     // 任务佣金\n\t\tStep            string    `plat:\"step\" json:\"step\"`                         // 任务步骤\n\t\tResult          string    `plat:\"result\" json:\"result\"`                     // 任务提交凭证\n\t\tStatus          byte      `plat:\"status\" json:\"status\"`                     // 1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:复审失败 7:已过期\n\t\tAdminAccount    string    `plat:\"admin_account\" json:\"admin_account\"`       // 操作人账号\n\t\tAcceptTs        int64     `plat:\"accept_ts\" json:\"accept_ts\"`               // 领取时间\n\t\tCommitTs        int64     `plat:\"commit_ts\" json:\"commit_ts\"`               // 提交时间\n\t\tVerifyTs        int64     `plat:\"verify_ts\" json:\"verify_ts\"`               // 审核时间\n\t\tReportTs        int64     `plat:\"report_ts\" json:\"report_ts\"`               // 复审提交时间\n\t\tReportReason    string    `plat:\"report_reason\" json:\"report_reason\"`       // 复审举报理由\n\t\tReverifyTs      int64     `plat:\"reverify_ts\" json:\"reverify_ts\"`           // 复审时间\n\t\tReverifyRemark  string    `plat:\"reverify_remark\" json:\"reverify_remark\"`   // 复审备注\n\t\tReverifyAccount string    `plat:\"reverify_account\" json:\"reverify_account\"` // 复审处理人 为空则为商家处理\n\t\tExpireTs        int64     `plat:\"expire_ts\" json:\"expire_ts\"`               // 过期时间\n\t\tInspectTs       int64     `plat:\"inspect_ts\" json:\"inspect_ts\"`             // 审核周期\n\t\tAutoCompleteTs  int64     `plat:\"auto_complete_ts\" json:\"auto_complete_ts\"` // 自动完成时间\n\t\tCommitMsg       string    `plat:\"commit_msg\" json:\"commit_msg\"`             // 订单提交信息\n\t\tRefuseMsg       string    `plat:\"refuse_msg\" json:\"refuse_msg\"`             // 拒绝理由\n\t\tRemark          string    `plat:\"remark\" json:\"remark\"`                     // 订单备注\n\t\tCreatedAt       time.Time `plat:\"created_at\" json:\"created_at\"`             // 创建时间\n\t\tUpdatedAt       time.Time `plat:\"updated_at\" json:\"updated_at\"`             // 更新时间\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task_subscribe.go",
    "groupTitle": "接单任务_Subscribe"
  },
  {
    "type": "put",
    "url": "/v1/task_subscribe",
    "title": "更新接单任务",
    "version": "0.1.0",
    "name": "更新",
    "group": "接单任务_Subscribe",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>接单任务Id\t- {status == 2, 才可以修改}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>任务状态：{ 1: 待提交 2:待审核 3:已通过 4:已拒绝 5:待复审 6:复审失败 7:已过期}</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "remark",
            "description": "<p>备注</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task_subscribe.go",
    "groupTitle": "接单任务_Subscribe"
  },
  {
    "type": "patch",
    "url": "/v1/task_subscribe",
    "title": "锁定/解锁接单任务",
    "version": "0.1.0",
    "name": "行为",
    "group": "接单任务_Subscribe",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>任务Id</li> </ul>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/task_subscribe.go",
    "groupTitle": "接单任务_Subscribe"
  },
  {
    "type": "Get",
    "url": "/v1/site_admin_log",
    "title": "管理员日志列表",
    "version": "0.1.0",
    "name": "日志",
    "group": "日志_SiteLogs",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "module",
            "description": "<p>模型 {config: site_admin_log_model}</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "action",
            "description": "<p>行为 {config: site_admin_log_action}</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "level",
            "description": "<p>等级 {config: site_admin_log_level}</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": null,\n\t\"remark: {\n\tId              int32     `plat:\"primary_key;id\" json:\"id\"`\n\tLevel           byte      `plat:\"level\" json:\"level\"`                         // 日志等级 1:普通 2：警告 3：严重\n\tModule          byte      `plat:\"module\" json:\"module\"`                       // 模块\n\tAction          byte      `plat:\"action\" json:\"action\"`                       // 行为：1:create，2:update，3:delete，4:select，5:other\n\tTitle           string    `plat:\"title\" json:\"title\"`                         // 标题\n\tDescription     string    `plat:\"description\" json:\"description\"`             // 描述\n\tActionAdminId   int32     `plat:\"action_admin_id\" json:\"action_admin_id\"`     // 管理员ID\n\tActionAdminName string    `plat:\"action_admin_name\" json:\"action_admin_name\"` // 管理员账户\n\tActionUserId    int32     `plat:\"action_user_id\" json:\"action_user_id\"`       // 被操作人ID\n\tActionUserName  string    `plat:\"action_user_name\" json:\"action_user_name\"`   // 被操作人账户\n\tActionAdminIp   string    `plat:\"action_admin_ip\" json:\"action_admin_ip\"`     // 操作者ip\n\tCreatedAt       time.Time `plat:\"created_at\" json:\"created_at\"`               // 创建时间\n\t},\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/site_admin_log.go",
    "groupTitle": "日志_SiteLogs"
  },
  {
    "type": "put",
    "url": "/v1/admin_role_permission",
    "title": "绑定权限",
    "version": "0.1.0",
    "name": "关联",
    "group": "权限列表_AdminPermission",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "role_id",
            "description": "<ul> <li>角色Id</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "permission_ids",
            "description": "<ul> <li>权限Id {  格式:  [{&quot;id&quot;: 5},{&quot;id&quot;: 6},{&quot;id&quot;:18}]       }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 { 1：启用 2：禁用, 默认：启用 }</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "module",
            "description": "<p>模块权限 {后期扩展}</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "sort",
            "description": "<p>排序</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_role_permission.go",
    "groupTitle": "权限列表_AdminPermission"
  },
  {
    "type": "post",
    "url": "/v1/admin_permission",
    "title": "创建权限",
    "version": "0.1.0",
    "name": "创建",
    "group": "权限列表_AdminPermission",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "parent_id",
            "description": "<ul> <li>父级Id \t{ 0:顶级 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "permission_name",
            "description": "<ul> <li>权限名称 \t{ 2 - 100个字符 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "permission_code",
            "description": "<ul> <li>权限路由限制标识 \t{ admin_permission }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "permission_path",
            "description": "<ul> <li>权限路由限制标识 \t{ --- }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "request_param",
            "description": "<ul> <li>请求方式 {get, post, put ,delete, patch, options}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "sort",
            "description": "<ul> <li>排序</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<ul> <li>列表展示类型 { 1：菜单 2：路由 3: 按钮}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<ul> <li>状态 { 1：显示 2：隐藏, 默认：显示 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "remark",
            "description": "<p>备注</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1000000006,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_permission.go",
    "groupTitle": "权限列表_AdminPermission"
  },
  {
    "type": "put",
    "url": "/v1/admin_permission",
    "title": "更新权限",
    "version": "0.1.0",
    "name": "更新",
    "group": "权限列表_AdminPermission",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>ID</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "parent_id",
            "description": "<ul> <li>父级Id \t{ 0:顶级 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "permission_name",
            "description": "<ul> <li>权限名称 \t{ 2 - 100个字符 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "permission_code",
            "description": "<ul> <li>权限路由限制标识 \t{ admin_permission }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "permission_path",
            "description": "<ul> <li>权限路由限制标识 \t{ --- }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "request_param",
            "description": "<ul> <li>请求方式 {get, post, put ,delete, patch, options}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "sort",
            "description": "<ul> <li>排序</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<ul> <li>列表展示类型 { 1：菜单 2：路由 3: 按钮}</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<ul> <li>状态 { 1：显示 2：隐藏, 默认：显示 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "remark",
            "description": "<p>备注</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_permission.go",
    "groupTitle": "权限列表_AdminPermission"
  },
  {
    "type": "get",
    "url": "/v1/admin_permission",
    "title": "权限选项",
    "version": "0.1.0",
    "name": "选项",
    "group": "权限列表_AdminPermission",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>查询直属下级 {优先级别高于parent_id}</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "parent_id",
            "description": "<p>查询所有下级</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\" : {\n\t\tId             int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tParentId       int32     `plat:\"parent_id\" json:\"parent_id\"`             // 上级id\n\t\tJoins          string    `plat:\"joins\" json:\"joins\"`                     // id路径\n\t\tPermissionName string    `plat:\"permission_name\" json:\"permission_name\"` // 权限名称\n\t\tPermissionCode string    `plat:\"permission_code\" json:\"permission_code\"` // 权限code\n\t\tPermissionPath string    `plat:\"permission_path\" json:\"permission_path\"` // 前端木板路径\n\t\tRequestParam   string    `plat:\"request_param\" json:\"request_param\"`     // 请求方法:get,post,put,patch,options\n\t\tSort           int32     `plat:\"sort\" json:\"sort\"`                       // 排序\n\t\tType           byte      `plat:\"type\" json:\"type\"`                       // 菜单类型： 1：菜单 2：路由 3：按钮\n\t\tStatus         byte      `plat:\"status\" json:\"status\"`                   // 状态1：显示 2：隐藏\n\t\tCreatedAt      time.Time `plat:\"created_at\" json:\"created_at\"`           // 创建时间\n\t\tUpdatedAt      time.Time `plat:\"updated_at\" json:\"updated_at\"`           // 更新时间\n\t\tCreatedIp      string    `plat:\"created_ip\" json:\"created_ip\"`           // 创建者Ip\n\t\t}\n\t\t\"msg\": \"成功\"\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_permission.go",
    "groupTitle": "权限列表_AdminPermission"
  },
  {
    "type": "Get",
    "url": "/v1/site_bank",
    "title": "站内支持的银行卡列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "站点相关_Site",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": null,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/site_bank.go",
    "groupTitle": "站点相关_Site"
  },
  {
    "type": "put",
    "url": "/v1/refresh",
    "title": "###  刷新TOKEN",
    "version": "0.1.0",
    "name": "刷新TOKEN",
    "group": "站点相关_Site",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "authorization",
            "description": "<ul> <li>token</li> </ul>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": {\n\t\t\"service_time\": 1582864529, #服务器当前时间戳\n\t\t\"token\": \"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6ImV2ZXJ5b25lIiwiRXhwaXJlc0F0IjoxNTgyNzE1Nzg2LCJJZCI6NDgsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6InBsYXRmb3JtLmFkbWluIiwiTm90QmVmb3JlIjowLCJTdWJqZWN0IjoicGxhdGZvcm0ifQ.JQj0QHC4iN-22XyfKucdeAGWb1-sTPsydjgxdACTmXU\"\n\t},\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/site_login.go",
    "groupTitle": "站点相关_Site"
  },
  {
    "type": "post",
    "url": "/v1/login",
    "title": "注销账户",
    "version": "0.1.0",
    "name": "注销",
    "group": "站点相关_Site",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>结果</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "\t{\n    \"code\": 200,\n    \"data\": null\n    \"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/site_logout.go",
    "groupTitle": "站点相关_Site"
  },
  {
    "type": "post",
    "url": "/v1/login",
    "title": "*** 登陆",
    "version": "0.1.0",
    "name": "登陆",
    "group": "站点相关_Site",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "account",
            "description": "<ul> <li>账户\t{ &gt; 5个字符 }\t\t @default：admin</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "login_password",
            "description": "<ul> <li>登陆密码 { 6 - 40个字符 }\t\t @default：admin</li> </ul>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>Authorization：Bearer token  [请求格式: Authorization = (固定前缀)Bearer(空格) (登陆返回：data字符串)token] *(默认有效期：1小时)</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": " {\n\t\"api\": 1583482081,\t# 配置缓存版本校验\n\t\"time\": 1583482137,\t# 服务器当前时间戳\n\t\"code\": 200,\n\t\"data\": {\n\t\t\"base\": {\n\t\t\"id\": 48,\n\t\t\"role_id\": 1,\n\t\t\"role_name\": \"技术部\",\n\t\t\"account\": \"test001\",\n\t\t\"nick_name\": \"allen\",\n\t},\n\t\"permission\": null,\n\t\"token\": \"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6ImV2ZXJ5b25lIiwiRXhwaXJlc0F0IjoxNTgzNDg1NzM3LCJJZCI6NDgsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6InBsYXRmb3JtLmFkbWluIiwiTm90QmVmb3JlIjowLCJTdWJqZWN0IjoicGxhdGZvcm0ifQ.gmbCw-lxA2IdfvIuVSU1ZIm89WiJ9yZMFQq4baJYVo0\"\n\t},\n\t\"msg\": \"成功\",\n\n }",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/site_login.go",
    "groupTitle": "站点相关_Site"
  },
  {
    "type": "Get",
    "url": "/v1/site_config",
    "title": "*** 配置信息",
    "version": "0.1.0",
    "name": "配置",
    "group": "站点相关_Site",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "\t{\n\t\t\"code\": 200,\n\t\t\"data\": {\n\t\t\t\"admin_status\": [\n            {\n                \"name\": \"启用\",\n                \"value\": 1\n            },\n            {\n                \"name\": \"禁用\",\n                \"value\": 2\n            }\n        ],\n\t\t},\n\t\t\"msg\": \"成功\"\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/site_config.go",
    "groupTitle": "站点相关_Site"
  },
  {
    "type": "get",
    "url": "/v1/admin_role_maps",
    "title": "角色权限列表maps",
    "version": "0.1.0",
    "name": "maps",
    "group": "管理角色_AdminRole",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>角色ID</li> </ul>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_role.go",
    "groupTitle": "管理角色_AdminRole"
  },
  {
    "type": "get",
    "url": "/v1/admin_role",
    "title": "管理角色列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "管理角色_AdminRole",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id查询详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "role_name",
            "description": "<p>角色名称</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {1：启用 2：禁用} {config: admin_role_status}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId        int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tRoleName  string    `plat:\"role_name\" json:\"role_name\"`   // 角色名称\n\t\tRoleCode  string    `plat:\"role_code\" json:\"role_code\"`   // 角色代号\n\t\tStatus    byte      `plat:\"status\" json:\"status\"`         // 1:启用 2：禁用\n\t\tRemark    string    `plat:\"remark\" json:\"remark\"`         // 备注\n\t\tCreatedAt time.Time `plat:\"created_at\" json:\"created_at\"` // 创建时间\n\t\tUpdatedAt time.Time `plat:\"updated_at\" json:\"updated_at\"` // 更新时间\n\t\tCreatedIp string    `plat:\"created_ip\" json:\"created_ip\"` // 创建Ip\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_role.go",
    "groupTitle": "管理角色_AdminRole"
  },
  {
    "type": "put",
    "url": "/v1/admin_role",
    "title": "更新管理角色",
    "version": "0.1.0",
    "name": "更新",
    "group": "管理角色_AdminRole",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "ID",
            "description": "<ul> <li>ID</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "role_name",
            "description": "<ul> <li>角色名称</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<ul> <li>状态 \t{ 1：启用 2：禁用 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "remark",
            "description": "<p>备注</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_role.go",
    "groupTitle": "管理角色_AdminRole"
  },
  {
    "type": "post",
    "url": "/v1/admin_role",
    "title": "添加管理角色",
    "version": "0.1.0",
    "name": "添加",
    "group": "管理角色_AdminRole",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "role_name",
            "description": "<ul> <li>角色名称 \t{ 4 - 40个字符 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<ul> <li>状态 \t{ 1：启用 2：禁用 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "remark",
            "description": "<p>备注</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1000000006,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_role.go",
    "groupTitle": "管理角色_AdminRole"
  },
  {
    "type": "get",
    "url": "/v1/admin_role_options",
    "title": "管理角色选项",
    "version": "0.1.0",
    "name": "选项",
    "group": "管理角色_AdminRole",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>ID</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "role_name",
            "description": "<ul> <li>角色名称</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<ul> <li>状态 \t{ 1：启用 2：禁用 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "remark",
            "description": "<p>备注</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin_role.go",
    "groupTitle": "管理角色_AdminRole"
  },
  {
    "type": "get",
    "url": "/v1/admin",
    "title": "管理员列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "管理账户_Admin",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>单条信息详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "account",
            "description": "<p>管理员账户</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "role_id",
            "description": "<p>角色ID</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 {1：显示 2：隐藏}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId            int32     `plat:\"primary_key;id\" json:\"id\"`\n\t\tRoleId        int32     `plat:\"role_id\" json:\"role_id\"`                 // 角色ID\n\t\tRoleName      string    `plat:\"role_name\" json:\"role_name\"`             // 角色名\n\t\tAccount       string    `plat:\"account\" json:\"account\"`                 // 账户\n\t\tNickName      string    `plat:\"nick_name\" json:\"nick_name\"`             // 昵称\n\t\tLoginPassword string    `plat:\"login_password\" json:\"login_password\"`   // 登陆密码\n\t\tSecretKey     string    `plat:\"secret_key\" json:\"secret_key\"`           // 安全秘钥\n\t\tStatus        byte      `plat:\"status\" json:\"status\"`                   // 状态：1:启用 2：停用\n\t\tCreatedAt     time.Time `plat:\"created_at\" json:\"created_at\"`           // 创建时间\n\t\tUpdatedAt     time.Time `plat:\"updated_at\" json:\"updated_at\"`           // 更新时间\n\t\tCreatedId     int32     `plat:\"created_id\" json:\"created_id\"`           // 创建管理ID\n\t\tCreatedIp     string    `plat:\"created_ip\" json:\"created_ip\"`           // 创建Ip\n\t\tLastLoginIp   string    `plat:\"last_login_ip\" json:\"last_login_ip\"`     // 最后登陆ip\n\t\tLoginCount    int32     `plat:\"login_count\" json:\"login_count\"`         // 登陆次数\n\t\tLastLoginTime time.Time `plat:\"last_login_time\" json:\"last_login_time\"` // 最后登陆时间\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin.go",
    "groupTitle": "管理账户_Admin"
  },
  {
    "type": "put",
    "url": "/v1/admin",
    "title": "更新管理员账户",
    "version": "0.1.0",
    "name": "更新",
    "group": "管理账户_Admin",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<ul> <li>ID</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "role_id",
            "description": "<ul> <li>角色id</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "role_name",
            "description": "<ul> <li>角色名</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "nick_name",
            "description": "<p>昵称</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "login_password",
            "description": "<p>登陆密码 { 6 - 40个字符 }</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>状态 \t{ 1：显示 2：隐藏 }</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin.go",
    "groupTitle": "管理账户_Admin"
  },
  {
    "type": "post",
    "url": "/v1/admin",
    "title": "创建管理员账户",
    "version": "0.1.0",
    "name": "添加",
    "group": "管理账户_Admin",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "role_id",
            "description": "<ul> <li>角色id</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "role_name",
            "description": "<ul> <li>角色名</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "account",
            "description": "<ul> <li>账户 \t{ 5 - 40个字符 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "login_password",
            "description": "<ul> <li>登陆密码 { 6 - 40个字符 }</li> </ul>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<ul> <li>状态 \t{ 1：启用 2：禁用 } {config: admin_status}</li> </ul>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1000000006,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin.go",
    "groupTitle": "管理账户_Admin"
  },
  {
    "type": "patch",
    "url": "/v1/admin",
    "title": "我的权限",
    "version": "0.1.0",
    "name": "选项",
    "group": "管理账户_Admin",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\"code\": 200,\n\t\"data\": 1,\n\t\"msg\": \"成功\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n  \t\"code\": 201,\n   \t\"data\": null\n   \t\"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/admin.go",
    "groupTitle": "管理账户_Admin"
  },
  {
    "type": "get",
    "url": "/v1/bill",
    "title": "账单流水列表",
    "version": "0.1.0",
    "name": "列表",
    "group": "账单管理_Bill",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page",
            "description": "<p>1</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "page_size",
            "description": "<p>20</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>单条信息详情</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "username",
            "description": "<p>用户名</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>账变形式 { 1: 加款 2：扣款 } {config : bill_type}</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "operate",
            "description": "<p>账变类型 { 1:存款 2:取款 3:发布任务 4:佣金 5:任务结束退回 6:提取佣金 }{config : bill_operate}</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "role",
            "description": "<p>账变方案 { 1:系统处理 2:人工处理} {config : bill_role}</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "code",
            "description": "<p>标识码 200：成功</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "msg",
            "description": "<p>提示信息</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "page",
            "description": "<p>分页</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"remark\": {\n\t\tId           int64     `plat:\"primary_key;id\" json:\"id\"`\n\t\tUserId       int32     `plat:\"user_id\" json:\"user_id\"`             // 用户ID\n\t\tUsername     string    `plat:\"username\" json:\"username\"`           // 用户名\n\t\tPhone        string    `plat:\"phone\" json:\"phone\"`                 // 手机号\n\t\tType         byte      `plat:\"type\" json:\"type\"`                   // 账变类型(1:加钱 2:扣钱)\n\t\tOperate      byte      `plat:\"operate\" json:\"operate\"`             // 1:存款 2:取款 3:发布任务 4:佣金 5:任务结束退回 6:提取佣金\n\t\tSrc          int32     `plat:\"src\" json:\"src\"`                     // 来源ID，默认为系统：0\n\t\tTaskId       int32     `plat:\"task_id\" json:\"task_id\"`             // 任务Id 当类型为发布任务或者获得佣金时此id生效\n\t\tStatus       byte      `plat:\"status\" json:\"status\"`               // 状态 1:待处理 2:成功 3:失败\n\t\tAmount       int32     `plat:\"amount\" json:\"amount\"`               // 交易金额\n\t\tBeforeAmount int32     `plat:\"before_amount\" json:\"before_amount\"` // 变动前金额\n\t\tAfterAmount  int32     `plat:\"after_amount\" json:\"after_amount\"`   // 变动后金额\n\t\tDesc         string    `plat:\"desc\" json:\"desc\"`                   // 账变描述\n\t\tCreatedAt    time.Time `plat:\"created_at\" json:\"created_at\"`       // 创建时间\n\t\tUpdatedAt    time.Time `plat:\"updated_at\" json:\"updated_at\"`       // 更新时间\n\t\t},\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "{\n   \"code\": 201,\n   \"data\": null\n   \"msg\": \"失败提示\",\n}",
          "type": "json"
        }
      ]
    },
    "filename": "app/hander/bill.go",
    "groupTitle": "账单管理_Bill"
  }
] });
