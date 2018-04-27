#!/bin/bash
VERSION=2.10.8
NAME="0x539-Samy/rundeck"

#docker build -t $NAME .
docker build -t $NAME:$VERSION .
docker tag $NAME:$VERSION $NAME:latest
