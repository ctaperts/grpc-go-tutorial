#!/bin/bash

echo running...

set -ex
# Setup greet pb file
protoc greet/greetpb/greet.proto --go_out=plugins=grpc:.
