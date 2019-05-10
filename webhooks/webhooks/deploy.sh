#!/bin/bash
unset GIT_DIR
#取webhook.php传递过来的变量
UserName=$1
repo=$2
repoHttpUrl=$3

echo "==============================================="
echo "deploying the web app"

PublicPath="/home/wwwroot/"
DeployPath="/home/wwwroot/blog/"
echo $repo
echo $DeployPath
echo $repoHttpUrl

if [[ -d "$DeployPath" ]]; then
    echo "文件夹存在"
    cd $DeployPath
    sudo env -i git pull
    sudo yes|cp -rf ../blog/* /home/wwwroot/default/ 2>&1
    
else
    echo "文件夹不存在"
    git clone $repoHttpUrl
    sudo yes|cp -rf blog/*  /home/wwwroot/default/
fi

time=`date`

echo "web server pull at webserver at time: $time."
echo "success!"
echo "================================================"
