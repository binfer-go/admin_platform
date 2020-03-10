package help

import (
	"fmt"
	"github.com/gogf/gf/util/gconv"
	"strconv"
)

func Decimal(value float64) float64 {
	value, _ = strconv.ParseFloat(fmt.Sprintf("%.2f", value/100), 64)
	return value
}

func DecimalIntVal(value float64) int32 {
	return gconv.Int32(value * 100)
}
