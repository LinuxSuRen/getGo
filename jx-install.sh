#!/bin/sh

echo "Prepare docker images for Jenkins X"

curl https://raw.githubusercontent.com/LinuxSuRen/getGo/master/jx-images.sh | bash

wget https://raw.githubusercontent.com/LinuxSuRen/getGo/master/.kube/config
mv config .kube

kubectl delete ns jx
helm del --purge jenkins-x