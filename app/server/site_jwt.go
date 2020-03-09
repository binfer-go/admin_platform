package server

import (
	"github.com/dgrijalva/jwt-go"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/util/gconv"
	"time"
)

var secret = g.Config().GetString("setting.secret")


const (
	TOKEN_EFFECTIVE_TIME = 60 * 60 * 1
)


type Tokens struct {
	Options
}

type Options struct {
	Id int32
	Ip string
	Audience  string
	ExpiresAt int64
	IssuedAt  int64
	Issuer    string
	NotBefore int64
	Subject   string
}

type Option func(options *Options)

func NewOptions(opts ...Option) Options {

	var opt = Options{
		Id:        0,
		Ip:        "",
		Audience:  "everyone",
		ExpiresAt: time.Now().Add(time.Second * TOKEN_EFFECTIVE_TIME).Unix(),
		IssuedAt:  0,
		Issuer:    "platform.admin",
		NotBefore: 0,
		Subject:   "platform",
	}
	for _,o := range opts {
		o(&opt)
	}

	return opt

}

func (*Tokens)Sign(o Options) (string, error) {

	token := jwt.New(jwt.SigningMethodHS256)
	claims := make(jwt.MapClaims)
	for key, value := range (gconv.Map(o)) {
		claims[key] = value
	}
	token.Claims = claims

	return token.SignedString([]byte(secret))

}



func (*Tokens) Check (token string) (Options, error) {

	var mod Options
	parseAuth, err := jwt.Parse(token, func(r *jwt.Token) (interface{}, error) {

		return []byte(secret), nil
	})
	if err != nil {
		return mod, err
	}
	_ = gconv.Struct(parseAuth.Claims, &mod)
	// claim := parseAuth.Claims.(jwt.MapClaims)

	return mod, nil

}

