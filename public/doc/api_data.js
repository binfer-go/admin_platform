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
            "description": "<p>状态</p>"
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
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
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
            "description": "<p>状态 {1：启用 2：禁用}</p>"
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
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
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
            "field": "ID",
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
            "field": "username",
            "description": "<p>用户标识</p>"
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
            "description": "<p>任务状态 {1:待发布 2:待审核 3:已通过 4:已拒绝 5:已关闭 6:已删除}</p>"
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
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
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
            "description": "<p>任务状态：{0:进行中 1:已提交 2:已拒绝 3:重新提交 4:已结算}</p>"
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
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
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
            "description": "<p>任务状态：{1:进行中 2:已提交 3:已拒绝 4:重新提交 5:已结算}</p>"
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
    "type": "post",
    "url": "/v1/login",
    "title": "登陆",
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
          "content": "\t{\n    \"code\": 200,\n    \"data\": \"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6IiIsIkV4cGlyZXNBdCI6MTU4MjM1MTQ4MSwiSWQiOjEsIklwIjoiMTAuMTAuMzUuMjUwIiwiSXNzdWVkQXQiOjAsIklzc3VlciI6IiIsIk5vdEJlZm9yZSI6MCwiU3ViamVjdCI6IiJ9.n4uqM02P_fZeoztmK4HnC9zOr-a_tV1pFa86fwscMZQ\",\n    \"msg\": \"成功\"\n}",
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
    "type": "Options",
    "url": "/v1/config",
    "title": "配置信息",
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
          "content": "{\n\t\"code\": 200,\n\t\"data\": {\n\t\t\"task_publish_status\": [\n\t\t\t\"待发布\",\n\t\t\t\"待审核\",\n\t\t\t\"已通过\",\n\t\t\t\"已拒绝\",\n\t\t\t\"已关闭\",\n\t\t\t\"已删除\"\n\t\t]\n\t},\n\t\"msg\": \"成功\"\n}",
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
            "description": "<p>状态 {1：启用 2：禁用}</p>"
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
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
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
            "description": "<p>状态 {1：启用 2：禁用}</p>"
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
          "content": "{\n\t\t\"code\": 200,\n\t\t\"data\": null,\n\t\t\"msg\": \"成功\",\n\t\t\"page\": {\n\t\t\t\"TotalPage\": 1,\n\t\t\t\"TotalSize\": 1,\n\t\t\t\"CurrentPage\": 1,\n\t\t\t\"PageBarNum\": 10\n\t\t}\n\t}",
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
            "field": "ID",
            "description": "<ul> <li>ID</li> </ul>"
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
            "description": "<ul> <li>状态 \t{ 1：启用 2：禁用 }</li> </ul>"
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
  }
] });
