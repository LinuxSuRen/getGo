#!/bin/bash

if [ $# -lt 3 ]; then
	echo 'You must give three params'
	echo 'cmd <namesapce> <imageId> <tag>'
	exit 1
fi

srcNamespace=$1
imageId=$2
tag=$3
namespace='surenpi'
echo $namespace

echo "prepare push to hangzhou"
docker login registry.cn-hangzhou.aliyuncs.com

cmd="docker tag $srcNamespace/$imageId:$tag registry.cn-hangzhou.aliyuncs.com/$namespace/$imageId:$tag"
echo "prepare to execute: $cmd"
$cmd

cmd="docker push registry.cn-hangzhou.aliyuncs.com/$namespace/$imageId:$tag"
echo "prepare to execute: $cmd"
$cmd

echo "prepare push to beijing"
docker login registry.cn-beijing.aliyuncs.com

cmd="docker tag $srcNamespace/$imageId:$tag registry.cn-beijing.aliyuncs.com/$namespace/$imageId:$tag"
echo "prepare to execute: $cmd"
$cmd

cmd="docker push registry.cn-beijing.aliyuncs.com/$namespace/$imageId:$tag"
echo "prepare to execute: $cmd"
$cmd

echo "prepare push to qingdao"
docker login registry.cn-qingdao.aliyuncs.com

cmd="docker tag $srcNamespace/$imageId:$tag registry.cn-qingdao.aliyuncs.com/$namespace/$imageId:$tag"
echo "prepare to execute: $cmd"
$cmd

cmd="docker push registry.cn-qingdao.aliyuncs.com/$namespace/$imageId:$tag"
echo "prepare to execute: $cmd"
$cmd
