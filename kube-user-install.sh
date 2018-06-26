#!/bin/bash
if [ "$1" == "" ]; then
    echo "write context name..."
    exit 1
fi

if [ "$2" == "" ]; then
    echo "write cluster ip..."
    exit 1
fi

export ADDRESS=https://$2:6443
export KEY=$1.key
export CERT=$1.crt

kubectl config set-cluster $1 --server=${ADDRESS} --insecure-skip-tls-verify=true
kubectl config set-credentials $1 --client-key=${KEY} --client-certificate=${CERT} --embed-certs=true
kubectl config set-context $1 --cluster=$1 --user=$1
kubectl config use-context $1