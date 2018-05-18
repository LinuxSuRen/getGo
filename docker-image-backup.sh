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

cmd="docker tag $srcNamespace/$imageId:$tag registry.cn-hangzhou.aliyuncs.com/$namespace/$imageId:$tag"
echo "prepare to execute: $cmd"
$cmd

cmd="docker push registry.cn-hangzhou.aliyuncs.com/$namespace/$imageId:$tag"
echo "prepare to execute: $cmd"
$cmd
