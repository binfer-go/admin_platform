package builder

import (
	"github.com/gogf/gf/util/gconv"
	"math/rand"
	"platform/app/model"
	"platform/app/server"
	"platform/app/server/report"
	"time"
)

// base报表
func BuilderMysqlTestData ()  {

	rand.Seed(time.Now().Unix())
	var temp model.Bill
	for i:=0;i< 10 ;i++ {
		temp.UserId = 100101006
		temp.Type   = gconv.Byte(rand.Intn(2)+1) 		// 1加钱 2减钱
		temp.Operate= gconv.Byte(rand.Intn(6)+1) 		// 1:存款 2:取款 3:发布任务 4:佣金 5:任务结束退回 6:提取佣金
		temp.Amount = gconv.Int32(rand.Intn(3000)) 		// 金额
		temp.Role   = gconv.Byte(rand.Intn(2)+1) 		// 1: 会员 2：人工
		temp.CreatedAt   = time.Now()
		temp.UpdatedAt   = time.Now()
		_, _ = server.ModelBill.Create(temp)
	}
}

// user报表
func BuilderMysqlReportUsers ()  {

	rand.Seed(time.Now().Unix())
	var temp model.ReportUsers
	for i:=0;i< 1 ;i++ {
		temp.UserId = 100101007
		temp.LoginCount = gconv.Int32(rand.Intn(60))
		temp.ComissionPromotionSum = gconv.Int32(rand.Intn(60))
		temp.ComissionTaskSum = gconv.Int32(rand.Intn(60))
		temp.DepositMasterSum = gconv.Int32(rand.Intn(60))
		temp.DepositTaskSum = gconv.Int32(rand.Intn(60))
		temp.TaskPubChildrerCount = gconv.Int32(rand.Intn(60))
		temp.TaskPubCount = gconv.Int32(rand.Intn(60))
		temp.TaskPubEndCount = gconv.Int32(rand.Intn(60))
		temp.TaskPubWaitChildrerCount = gconv.Int32(rand.Intn(60))
		temp.TaskSubEndCount = gconv.Int32(rand.Intn(60))
		temp.TaskPubWaitCount = gconv.Int32(rand.Intn(60))
		temp.TaskPubEndChildrerCount = gconv.Int32(rand.Intn(60))
		temp.LoginCount  = gconv.Int32(rand.Intn(60))
		temp.WithdrawTaskSum  = gconv.Int32(rand.Intn(60))
		temp.TaskPubEndChildrerCount = gconv.Int32(rand.Intn(60))
		temp.TaskPubEndCount = gconv.Int32(rand.Intn(60))
		temp.TaskSubEndCount = gconv.Int32(rand.Intn(60))
		temp.Phone = ""
		temp.CreatedAt   = time.Now()
		temp.UpdatedAt   = time.Now()
		_, _ = report.ModelReportUser.Create(temp)
	}
}

func BuilderTaskPublish ()  {
	rand.Seed(time.Now().Unix())
	var temp model.TaskPublish
	for i:=0;i< 1 ;i++ {
		temp.UserId = 100101007
		temp.Amount = gconv.Int32(rand.Intn(60))
		temp.Status = gconv.Byte(rand.Intn(4)+1)
		temp.Count  = gconv.Int32(rand.Intn(60))
		temp.Rate   = gconv.Float64(rand.Intn(20))
		temp.Title  = gconv.String(rand.Intn(11111111160))
		temp.Step   =  "{}"
		temp.Commit = gconv.Int32(rand.Intn(30))
		temp.Describe = gconv.String(rand.Intn(9099999999))
		temp.Project = gconv.String(rand.Intn(100000))
		temp.Accept  = gconv.Int32(rand.Intn(30))
		temp.CreatedAt   = time.Now()
		temp.UpdatedAt   = time.Now()
		_, _ = server.ModelTaskPublish.Create(temp)
	}
}


func BuilderTaskSubscribe ()  {
	rand.Seed(time.Now().Unix())
	var temp model.TaskSubscribe
	for i:=0;i< 1 ;i++ {
		temp.UserId = 100101007
		temp.Amount = gconv.Int32(rand.Intn(60))
		temp.Status = gconv.Byte(rand.Intn(7)+1)
		temp.Result = "---"
		temp.TaskId = 100101048
		temp.TaskType = 1
		temp.Step   =  "{}"
		temp.RefuseMsg = "{}"
		temp.Result = "{}"
		temp.Project = gconv.String(rand.Intn(100000))
		temp.CreatedAt   = time.Now()
		temp.UpdatedAt   = time.Now()
		_, _ = server.ModelTaskSubscribe.Create(temp)
	}
}