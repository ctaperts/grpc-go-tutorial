# Simple tutorial on gRPC

Simple tutorial, based on the lessons from Stephane Maarek: gRPC [Golang] Master Class, on gRPC which covers the super basics on how to setup a gRPC client/server using golang

## gRPC concepts

unary calls - one message to server and one message response to client
`https://grpc.io/docs/guides/concepts.html#unary-rpc`

server streaming - one message to server and streaming response back to client
`https://grpc.io/docs/guides/concepts.html#server-streaming-rpc`

client streaming - streaming message to server and one message response back to client
`https://grpc.io/docs/guides/concepts.html#client-streaming-rpc`

bi-directional streaming - streaming to server and streaming to client
`https://grpc.io/docs/guides/concepts.html#bidirectional-streaming-rpc`

## Install grpc/proto

`go get -u google.golang.org/grpc`

`go get -u github.com/golang/protobuf/protoc-gen-go`

## Steps to generate setup

create the protobuff golang setup
```
./generate.sh
```
will generate `greet/greetpb/greet.pb.go` view the comments in the `./greet/greetpb/greet.proto` and find them again in the generated file

`greet/greetpb/greet.pb.go` will be generated with all of the functions from the `./greet/greetpb/greet.proto` and additional functions used in the server/client.
For example in `./greet/greetpb/greet.proto` the line
```
    rpc GreetWithDeadline(GreetWithDeadlineRequest) returns (GreetWithDeadlineResponse) {};
```
will create a function `GreetWithDeadline` used in `server.go` and in the `client.go` file. view the `GreetServiceClient interface` and the `GreetServiceServer interface` for more info.

## Run

The following is a simple unary call that will timeout on the second request because of the deadline/timeout

run with one terminal running
```
go run greet/greet_server/server.go
```
and in another terminal run
```
go run greet/greet_client/client.go
```
