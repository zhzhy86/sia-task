#!/usr/bin/env bash
str=$(cd "$(dirname "$0")";pwd)

volums_path="-v ${str}/jarConfig:/app/jar/ROOT/jarConfig -v ${str}/jarConfig:/app/jar/ROOT/jarConfig"

if  [ ! $1 ]; then
volums_path=""
fi

# -v /etc/localtime:/etc/localtime
docker run --name scheduler-test -d  ${volums_path}  -p 10615:10615 -p 8081:8081 -p 19011:19011 --restart=on-failure:10  --privileged=true sia/scheduler:v1 /bin/bash -c " /app/jar/ROOT/docker-start.sh "

