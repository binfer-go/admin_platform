
```
D:\nodejs\node_global\apidoc.cmd   -i .\app\hander\ -o .\public\doc

generrcode.exe /app/errcode

——————————————————————————————————

```

---


|       GET     |     POST      |     PUT     |     PATCH      |      OPTIONS    |   OTHER  |
| ------------- | :-----------: | :---------: | -------------  | :-----------:   | -----:   |
|       列表     |     添加      |     修改     |     行为       |      配置信息    |   其他   |



[
{
"id":2,
"parent_id":1,
"permission_code":"system",
"permission_name":"系统管理",
"permission_path":"system",
"request_param":"OPTIONS",
"status":1,"type":1
},
{"id":3,"parent_id":2,"permission_code":"admin_permission","permission_name":"权限列表","permission_path":"system/index","request_param":"GET","status":1,"type":2},{"id":4,"parent_id":2,"permission_code":"admin_permission","permission_name":"添加权限","permission_path":"system/auth_add","request_param":"POST","status":1,"type":3},{"id":5,"parent_id":2,"permission_code":"admin_permission","permission_name":"编辑权限","permission_path":"system/auth_edit","request_param":"PUT","status":1,"type":3},{"id":6,"parent_id":2,"permission_code":"admin_role","permission_name":"角色列表","permission_path":"system/role_list","request_param":"GET","status":1,"type":2},{"id":7,"parent_id":2,"permission_code":"admin_role","permission_name":"添加角色","permission_path":"system/role_add","request_param":"POST","status":2,"type":2},{"id":8,"parent_id":2,"permission_code":"admin_role","permission_name":"编辑角色","permission_path":"system/role_edit","request_param":"PUT","status":1,"type":3},{"id":9,"parent_id":2,"permission_code":"admin","permission_name":"用户列表","permission_path":"system/user_list","request_param":"GET","status":1,"type":2},{"id":10,"parent_id":2,"permission_code":"admin","permission_name":"用户详情（编辑）","permission_path":"system/user_edit","request_param":"GET","status":2,"type":2},{"id":11,"parent_id":1,"permission_code":"site_user","permission_name":"会员管理","permission_path":"member","request_param":"OPTIONS","status":1,"type":1},{"id":13,"parent_id":1,"permission_code":"task_publish","permission_name":"财务管理","permission_path":"task","request_param":"GET","status":1,"type":1},{"id":18,"parent_id":11,"permission_code":"user_deposit","permission_name":"存款列表","permission_path":"member/deposit_list","request_param":"GET","status":1,"type":2},{"id":20,"parent_id":11,"permission_code":"user_bank","permission_name":"银行卡列表","permission_path":"member/bank_list","request_param":"GET","status":1,"type":2},{"id":25,"parent_id":2,"permission_code":"admin","permission_name":"添加用户","permission_path":"system/user_add","request_param":"POST","status":1,"type":3}]