#!/bin/bash
unset GIT_DIR

# -------------------------------------------------------------
# �û���������
# �밴Ҫ���޸���������
# �����ʵ�ַΪ��http://ip/����û���/��Ĳֿ���/index.html"
# ���ű�������Ҳ���ʹ��,����������ף��벻Ҫ�ƻ���

# UserName������û���
# repo����Ĳֿ���
# repoHttpUrl����Ĳֿ��¡��http��ʽ������

# ������Բο���������
UserName="pqs"
repo="web"
repoHttpUrl="http://154.222.1.166:10080/pqs/web.git"
# -------------------------------------------------------------

echo "==============================================="
echo "deploying the web app"

PublicPath="/data/nginx/html/"
DeployPath=$PublicPath$UserName
pwd
if [[ -d "$DeployPath" ]]; then
    echo "�ļ��д���"
    cd $DeployPath
    if [[ -d "$repo" ]]; then
    	echo "repo����"
        cd $repo
    	env -i git pull
    else
    	echo "repo������"
        git clone $repoHttpUrl
    	cd $repo
    	env -i git pull
    fi
    
else
    echo "�ļ��в�����"
    mkdir $DeployPath
    cd $DeployPath
    git clone $repoHttpUrl
    cd $repo
    env -i git pull
fi

time=`date`

echo "web server pull at webserver at time: $time."
echo "���ʵ�ַ��http://ip/"$UserName"/"$repo"/index.html"
echo "================================================"