package env

import (
	"github.com/gogf/gf/container/gmap"
)

var MapsManagements managements

type managements struct {
	Admins *gmap.Map
}

func init()  {
	MapsManagements.Admins = gmap.New(true)
}



