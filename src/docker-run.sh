#!/bin/sh

app_name="lifelog-with-twitter"

# build the dockerfile, if it is not already build.
[ ! -z $( docker images -q node) ] || {
    docker build -t ${app_name} .
}

# FIXME: replace this file to docker-compose.yml
docker run -itd \
    --hostname ${app_name} \
    --name ${app_name} \
    -v $PWD:/usr/src \
    -p 8080:80 \
    ${app_name} \
    bash 
