#!/bin/sh

docker pull registry.cn-hangzhou.aliyuncs.com/surenpi/tiller:v2.9.1
docker tag registry.cn-hangzhou.aliyuncs.com/surenpi/tiller:v2.9.1 gcr.io/kubernetes-helm/tiller:v2.9.1

docker pull registry.cn-hangzhou.aliyuncs.com/surenpi/monocular-api:v0.6.1
docker tag registry.cn-hangzhou.aliyuncs.com/surenpi/monocular-api:v0.6.1 bitnami/monocular-api:v0.6.1

docker pull registry.cn-hangzhou.aliyuncs.com/surenpi/addon-resizer:1.7
docker tag registry.cn-hangzhou.aliyuncs.com/surenpi/addon-resizer:1.7 k8s.gcr.io/addon-resizer:1.7

docker pull registry.cn-hangzhou.aliyuncs.com/surenpi/heapster:v1.3.0
docker tag registry.cn-hangzhou.aliyuncs.com/surenpi/heapster:v1.3.0 k8s.gcr.io/heapster:v1.3.0

docker pull registry.cn-hangzhou.aliyuncs.com/surenpi/jenkinsx:0.0.25
docker tag registry.cn-hangzhou.aliyuncs.com/surenpi/jenkinsx:0.0.25 jenkinsxio/jenkinsx:0.0.25

docker pull registry.cn-hangzhou.aliyuncs.com/surenpi/mongodb:3.4.9-r1
docker tag registry.cn-hangzhou.aliyuncs.com/surenpi/mongodb:3.4.9-r1 docker.io/bitnami/mongodb:3.4.9-r1

docker pull registry.cn-beijing.aliyuncs.com/surenpi/nexus:0.0.14
docker tag registry.cn-beijing.aliyuncs.com/surenpi/nexus:0.0.14 docker.io/jenkinsxio/nexus

docker pull registry.cn-hangzhou.aliyuncs.com/surenpi/builder-maven:0.0.307
docker tag registry.cn-hangzhou.aliyuncs.com/surenpi/builder-maven:0.0.307 docker.io/jenkinsxio/builder-maven:0.0.307

docker pull registry.cn-beijing.aliyuncs.com/surenpi/jnlp-slave:3.14-1
docker tag registry.cn-beijing.aliyuncs.com/surenpi/jnlp-slave:3.14-1 jenkinsci/jnlp-slave:3.14-1

docker pull registry.cn-beijing.aliyuncs.com/surenpi/defaultbackend:1.3
docker tag registry.cn-beijing.aliyuncs.com/surenpi/defaultbackend:1.3 k8s.gcr.io/defaultbackend:1.3

docker pull registry.cn-beijing.aliyuncs.com/surenpi/nginx-ingress-controller:0.13.0
docker registry.cn-beijing.aliyuncs.com/surenpi/nginx-ingress-controller:0.13.0 quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.13.0