#!/bin/bash
NAME="0x539samy/rundeck"

docker build -t $NAME .
docker tag $NAME $NAME:latest

[ $? != 0 ] && \
        echo  "Docker image build failed !" && exit 10
