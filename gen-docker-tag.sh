kubectl get pod | grep -e 'ImagePullBackOff\|ErrImagePull' | awk '{print $1}' | xargs kubectl describe pod | grep "Back-off pulling image" | awk -F 'Back-off pulling image' '{print $2 }'  | awk -F '"' '{print $2}' | awk -F ':' '{name=$1;gsub(/.*\//,"",name);print "sudo docker pull "$1":"$2" && sudo docker tag "$1":"$2" registry.cn-beijing.aliyuncs.com/surenpi/"name":"$2" && docker push registry.cn-beijing.aliyuncs.com/surenpi/"name":"$2}'
