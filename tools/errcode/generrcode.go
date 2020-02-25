package main

import (
	"fmt"
	"go/ast"
	"go/parser"
	"go/token"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

func visit(path string, info os.FileInfo, err error) error {
	if info.IsDir() {
		return nil
	}
	if info.Name() != "err.go" {
		return nil
	}

	return parse(path)
}
func main() {
	wd, err := os.Getwd()
	if err != nil {
		panic(err)
	}
	err = filepath.Walk(wd, visit)
	if err != nil {
		panic(err)
	}

}

func parse(path string) error {
	fset := token.NewFileSet()
	f, err := parser.ParseFile(fset, path, nil, parser.ParseComments)
	if err != nil {
		return err
	}

	dst, err := os.Create("errcode.go")
	if err != nil {
		return err
	}
	fmt.Fprintf(dst, "package %s\ntype ErrCode int32", f.Name.Name)

	var mapping [][2]string

	ast.Inspect(f, func(n ast.Node) bool {
		ret, ok := n.(*ast.GenDecl)
		if !ok {
			return true
		}
		if ret.Tok != token.VAR {
			return true
		}
		for _, v := range ret.Specs {
			valueSpec, ok := v.(*ast.ValueSpec)
			if !ok {
				continue
			}
			vv := [2]string{strings.TrimSpace(valueSpec.Comment.Text()), valueSpec.Names[0].String()}
			mapping = append(mapping, vv)
		}
		return true
	})

	codeNum := 200
	consts := make([]string, len(mapping))
	codeFunc := make([]string, len(mapping))
	errFunc := make([]string, len(mapping))

	for k, v := range mapping {
		consts[k] = fmt.Sprintf("ErrCode%s ErrCode = %d", v[1], codeNum)
		codeNum++

		codeFunc[k] = fmt.Sprintf("case ErrCode%s:\nreturn \"%s\"", v[1], v[0])
		errFunc[k] = fmt.Sprintf("case %s:\nreturn %s", v[1], fmt.Sprintf("ErrCode%s", v[1]))
	}

	fmt.Fprintf(dst, "\nconst(\n%s\n)\n", strings.Join(consts, "\n"))

	fmt.Fprintf(dst, "func(code ErrCode) String() string {\nswitch code {\n%s\ndefault:\nreturn \"系统繁忙\"\n}\n}\n\n", strings.Join(codeFunc, "\n"))
	fmt.Fprintf(dst, "func Code(err error) ErrCode {\nswitch err {\n%s\ndefault:\nreturn -1\n}\n}", strings.Join(errFunc, "\n"))

	cmd := exec.Command("gofmt", "-w", "errcode.go")
	cmd.Run()
	return nil
}
