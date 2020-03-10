package rpc

import (
	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"time"
)

var client BackendClient

func init()  {

}

func RegisterClient(addr string) error {

	ctx, _:= context.WithTimeout(context.TODO(), time.Second * 3)
	conn, err := grpc.DialContext(ctx, addr, grpc.WithInsecure())
	if err != nil {
		return err
	}
	client = NewBackendClient(conn)
	return nil

}

func GrpcConn() BackendClient {
	return client
}
