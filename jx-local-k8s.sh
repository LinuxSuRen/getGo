#!/bin/bash

kubectl patch deploy -n jx jenkins --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/volumes/3", "value":{"hostPath":{"path": "/root/.k8s.data/jenkins","type": ""},"name": "jenkins-home"}}]'
kubectl patch deploy -n jx jenkins -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'

kubectl patch deploy -n jx jenkins-x-nexus --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/volumes/1", "value":{"hostPath":{"path": "/root/.k8s.data/jenkins-x-nexus","type": ""},"name": "nexus-data-volume"}}]'
kubectl patch deploy -n jx jenkins-x-nexus -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'

kubectl patch deploy -n jx jenkins-x-mongodb --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/volumes/0", "value":{"hostPath":{"path": "/root/.k8s.data/jenkins-x-mongodb","type": ""},"name": "data"}}]'
kubectl patch deploy -n jx jenkins-x-mongodb -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'

kubectl patch deploy -n jx jenkins-x-chartmuseum --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/volumes/0", "value":{"hostPath":{"path": "/root/.k8s.data/jenkins-x-chartmuseum","type": ""},"name": "storage-volume"}}]'
kubectl patch deploy -n jx jenkins-x-chartmuseum -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'

kubectl patch deploy -n jx jenkins-x-docker-registry --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/volumes/0", "value":{"hostPath":{"path": "/root/.k8s.data/jenkins-x-docker-registry","type": ""},"name": "data"}}]'
kubectl patch deploy -n jx jenkins-x-docker-registry -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'

kubectl patch deploy -n jx pipelinecontroller -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'
kubectl patch deploy -n jx jenkins-x-monocular-api -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'
kubectl patch deploy -n jx jenkins-x-monocular-ui -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'
kubectl patch deploy -n jx jenkins-x-heapster -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'
kubectl patch deploy -n jx jenkins-x-monocular-prerender -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'

kubectl patch deploy -n kube-system jxing-nginx-ingress-controller -p '{"spec":{"template":{"spec":{"hostNetwork":true}}}}'

kubectl patch deploy -n kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'
kubectl patch deploy -n kube-system jxing-nginx-ingress-default-backend -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'
kubectl patch deploy -n kube-system jxing-nginx-ingress-controller -p '{"spec":{"template":{"spec":{"nodeSelector":{"name":"master"}}}}}'
