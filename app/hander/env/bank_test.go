package env

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"io/ioutil"
	"platform/app/server"
	"testing"
)

type MongoConfig struct {
	Code  string `json:"bank_code"`
	Name string `json:"bank_name"`
	Icon     string
}


func TestBank(t *testing.T)  {


	data, err := ioutil.ReadFile("bank.js")
	if err != nil {
		return
	}
	var mod []MongoConfig
	err = json.Unmarshal(data, &mod)
	_,_ = server.ModelSiteBank.Create(mod)
	g.Dump(mod, err)

}


