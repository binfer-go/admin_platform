package help

import (
	"encoding/json"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"time"
)

func Uploads(req *ghttp.Request, image string, prefix interface{}) (interface{}, error)  {

	files := req.GetUploadFiles(image)
	if files == nil {
		return nil, nil
	}
	uploadPath := g.Config().GetString("setting.upload")
	//_ = g.Config().SetPath(uploadPath)
	imgs := g.Slice{}
	file_prefix_name := gconv.String(time.Now().UnixNano()) + gconv.String(prefix)
	for _ , v := range files {
		v.Filename = file_prefix_name+v.Filename
		imgs = append(imgs, uploadPath+"/"+v.Filename)
	}
	data, _ := json.Marshal(&imgs)
	if err := files.Save(uploadPath); err != nil {
		return nil, err
	}
	return string(data), nil

}
