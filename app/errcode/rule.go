package errcode

var (
	Valid_LoginAccount = map[string]string{"rule":"required|length:5,40","msg":"用户名必须填写|长度为 5 - 40个字符"}
)