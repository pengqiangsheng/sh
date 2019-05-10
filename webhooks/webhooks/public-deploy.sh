#!/bin/bash
unset GIT_DIR

# -------------------------------------------------------------
# 用户配置区域
# 请按要求修改如下配置
# 最后访问地址为：http://gitku.cn:8083/你的用户名/你的仓库名/index.html"
# 本脚本仅供大家测试使用,服务器搭建不易，请不要破坏！

# UserName是你的用户名
# repo是你的仓库名
# repoHttpUrl是你的仓库克隆的http方式的链接

# 具体可以参考如下配置
UserName=$1
repo=$2
repoHttpUrl=$3
# -------------------------------------------------------------

echo "==============================================="
echo "deploying the web app"

PublicPath="/home/wwwroot/default/"
DeployPath=$PublicPath$UserName


if [[ -d "$DeployPath" ]]; then
    echo "文件夹存在"
    cd $DeployPath
    if [[ -d "$repo" ]]; then
    	echo "repo存在"
        cd $repo
    	env -i git pull
    else
    	echo "repo不存在"
        git clone $repoHttpUrl
    	cd $repo
    	env -i git pull
    fi
    
else
    echo "文件夹不存在"
    mkdir $DeployPath
    cd $DeployPath
    git clone $repoHttpUrl
    cd $repo
    env -i git pull
fi

time=`date`

echo "web server pull at webserver at time: $time."
echo "访问地址：http://ip/"$UserName"/"$repo"/index.html"
echo "================================================"
