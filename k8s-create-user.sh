#!/bin/bash
NAME="$1"
if [ "$1" == "" ]; then
    NAME="user"
fi

kubectl delete clusterrolebinding ${NAME}-admin

openssl genrsa -out ${NAME}.key 2048
openssl req -new -key ${NAME}.key -out ${NAME}.csr -subj "/CN=${NAME}/O=jx"
openssl x509 -req -in ${NAME}.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out ${NAME}.crt -days 800

kubectl create clusterrolebinding ${NAME}-admin \
    --clusterrole=cluster-admin \
    --user=${NAME}

wget https://raw.githubusercontent.com/LinuxSuRen/getGo/master/kube-user-install.sh
mv kube-user-install.sh install.sh
chmod u+x install.sh

tar czvf ${NAME}.tar.gz ${NAME}* install.sh
rm -rfv ${NAME}.key ${NAME}.csr ${NAME}.crt install.sh

chown $USER:$USER ${NAME}.tar.gz