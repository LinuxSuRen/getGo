#!/bin/bash

kubectl patch deploy -n jx jenkins -p '{"spec":{"template":{"spec":{"volumes":[{"hostPath":{"path": "~.k8s.data/jenkins","type": ""},"name": "jenkins-home"}]}}}}'

kubectl patch deploy -n jx jenkins-x-nexus -p '{"spec":{"template":{"spec":{"volumes":[{"hostPath":{"path": "~.k8s.data/jenkins-x-nexus","type": ""},"name": "nexus-data-volume"}]}}}}'

kubectl patch deploy -n jx jenkins-x-mongodb -p '{"spec":{"template":{"spec":{"volumes":[{"hostPath":{"path": "~.k8s.data/jenkins-x-mongodb","type": ""},"name": "jenkins-x-mongodb"}]}}}}'

kubectl patch deploy -n jx jenkins-x-chartmuseum -p '{"spec":{"template":{"spec":{"volumes":[{"hostPath":{"path": "~.k8s.data/jenkins-x-chartmuseum","type": ""},"name": "storage-volume"}]}}}}'

kubectl patch deploy -n jx jenkins-x-docker-registry -p '{"spec":{"template":{"spec":{"volumes":[{"hostPath":{"path": "~.k8s.data/jenkins-x-docker-registry","type": ""},"name": "data"}]}}}}'

kubectl patch deploy -n kube-system jxing-nginx-ingress-controller -p '{"spec":{"template":{"spec":{"hostNetwork":true}}}}'
