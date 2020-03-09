package role

import (
	"testing"
)

func TestExample_Get(t *testing.T) {


}

type Wl struct {

}
func (*Wl) Get () int {
	return 1
}