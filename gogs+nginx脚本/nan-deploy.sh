#!/bin/bash

# -------------------------------------------------------------
echo "===================start progress================="

DeployPath=$1
port1=$2
port2=$3
port3=$4

if [[ -d "$DeployPath" ]]; then
    echo "exist"
    yes|rm -rf $DeployPath
else
    echo "not exist"
fi

mkdir $DeployPath
docker stop gogs
docker rm gogs
docker stop nginx
docker rm nginx

docker run -d --name gogs --net="bridge" -p $port1:3000 -p $port2:22 -v $DeployPath:/data gogs/gogs
cd $DeployPath
mkdir -p nginx
mkdir -p nginx/conf 
docker run --name test -d nginx  
docker cp test:/etc/nginx/nginx.conf $DeployPath/nginx/conf/

docker run --name nginx --privileged -it -p $port3:80 \
-v $DeployPath/nginx/conf/nginx.conf:/etc/nginx/nginx.conf:ro \
-v $DeployPath/nginx/conf/conf.d:/etc/nginx/conf.d:ro \
-v $DeployPath/nginx/html:/usr/share/nginx/html:rw \
-v $DeployPath/nginx/logs:/var/log/nginx -d nginx

docker cp test:/etc/nginx/conf.d/default.conf $DeployPath/nginx/conf/conf.d

cd $DeployPath/nginx/html
echo "docker" > index.html

docker restart nginx
docker stop test
docker rm test
docker ps
chmod -R 777 $DeployPath/nginx/html
echo "======================end======================="
