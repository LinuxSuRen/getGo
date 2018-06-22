#!/bin/sh

#sudo apt-get update && sudo apt-get install python -y

#wget http://get.alauda.cn/deploy/ake/ake && chmod u+x ake && ./ake up


kube-config="\
apiVersion: v1 \
clusters: \
- cluster: \
    insecure-skip-tls-verify: true \
    server: http://localhost:8080 \
  name: local \
contexts: \
- context: \
    cluster: local \
    namespace: jx \
    user: "" \
  name: local \
current-context: local \
kind: Config \
preferences: {} \
users: \
- name: local \
  user: \
    as-user-extra: {} \" 

echo $kube-config
