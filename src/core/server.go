package main

import (
	"net"
	"log"
	"sync"
	"strconv"

	"google.golang.org/grpc"
	"golang.org/x/net/context"
)

var wg = &sync.WaitGroup{}

var (
	serverIP = net.IPv4(0, 0, 0, 0)
	serverPort = 31497
)

type kvStore struct {
	data sync.Map
}

type server struct {
	addr string
	kvStore *kvStore
}

type readResult struct {
    value interface{}
    ok bool
}

func (s *server) init(addr string, kvStore *kvStore) {
	s.addr = addr
	s.kvStore = kvStore
}

func (s *server) listen() {
	defer wg.Done()
	listener, err := net.Listen("tcp", s.addr)
	if err != nil {
		log.Fatalln("Failed to listen on TCP: ", err)
	}

	grpcServer := grpc.NewServer()
	RegisterGoKVServer(grpcServer, s)
	if err := grpcServer.Serve(listener); err != nil {
		log.Fatalln("Failed to serve gRPC: ", err)
	}
}

// ReadKVRPC returns the requested KV pair from the store if it exists
func (s *server) ReadKVRPC(ctx context.Context, req *ReadKVRequest) (res *ReadKVResponse, err error) {
	key := req.Key

	if key == "" {
		return &ReadKVResponse{Success: false}, nil
	}

	ch := make(chan readResult)
	go s.kvStore.readEntry(key, ch)
	op := <-ch

	if !op.ok {
		return &ReadKVResponse{Success: false, Key: key}, nil
	}
	value, ok := op.value.(string)
	if !ok {
		return &ReadKVResponse{Success: false, Key: key}, nil	
	}
	return &ReadKVResponse{Success: true, Key: key, Value: value}, nil
}

// WriteKVRPC writes a KV pair into the store
func (s *server) WriteKVRPC(ctx context.Context, req *WriteKVRequest) (res *WriteKVResponse, err error) {
	key := req.Key
	value := req.Value

	if key == "" {
		return &WriteKVResponse{Success: false}, nil
	}

	go s.kvStore.writeEntry(key, value)

	return &WriteKVResponse{Success: true, Key: key}, nil
}

func main() {
	s := server{}
	kvStore := kvStore{}
	addr := serverIP.String() + ":" + strconv.Itoa(serverPort)
	s.init(addr, &kvStore)

	wg.Add(1)
	go s.listen()
	log.Println("GoKV listening at:", addr)

	wg.Wait()
}