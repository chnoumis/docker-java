#!/bin/sh

. ./setenv.sh
sudo docker build -t java:${DOCKER_VERSION} .