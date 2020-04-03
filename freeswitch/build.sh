#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/signalwire/freeswitch.git"}
COMMIT=${1:-"$(../bin/get-commit $REPO)"}

echo a5cecbfc2a5e0ea2d3f45489f2681a67e32ce955 > etc/commit

docker build $BUILD_FLAGS --build-arg REPO=$REPO -t $NETWORK/freeswitch .
