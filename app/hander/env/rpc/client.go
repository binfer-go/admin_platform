package rpc

import "google.golang.org/grpc"

var client TaskClient

func RegisterClient(addr string) error {
	c, err := grpc.Dial(addr, grpc.WithInsecure())
	if err != nil {
		return err
	}
	client = NewTaskClient(c)
	return nil
}

func TaskConn() TaskClient {
	return client
}
