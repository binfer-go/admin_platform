package server

import (
	"github.com/gogf/gf/frame/g"
	"testing"
)


func TestCheckAccount(t *testing.T) {
	var token Tokens
	ts, err := token.Sign(NewOptions(func(options *Options) {
		options.Id = 1
		options.Ip = "0.0.0.0"
	}))
	g.Dump(ts, err)
}

func TestTokens_Check(t *testing.T) {
	var token Tokens

	rs, err := token.Check("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdWRpZW5jZSI6IiIsIkV4cGlyZXNBdCI6MTU4MjM1MTg5NCwiSWQiOjEsIklwIjoiMC4wLjAuMCIsIklzc3VlZEF0IjowLCJJc3N1ZXIiOiIiLCJOb3RCZWZvcmUiOjAsIlN1YmplY3QiOiIifQ.SF8PglWndeAPGITlTBlYoc0NSvjxxq6qYF7ox9IQfQw")
	g.Dump(rs, err)
}

func TestTokens_Sign(t *testing.T) {


	i := ModelTaskPublish.GetSum(nil,"")
	g.Dump(i)
}