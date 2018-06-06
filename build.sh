#!/bin/bash
RUNDECK_LATEST_VERSION=2.11.3
NAME="0x539samy/rundeck"

docker build -t $NAME   --build-arg LATEST=$RUNDECK_LATEST_VERSION .
docker tag $NAME:$VERSION $NAME:latest
