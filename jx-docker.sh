#!/bin/bash

apt-get install python -y

read -p 'do we need install docker? yes or no?' name
if [ "$name" = "yes" ]; then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  apt-key fingerprint 0EBFCD88

  add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"

  apt-get update -y

  apt-cache madison docker-ce

  apt-get install docker-ce=17.12.0~ce-0~ubuntu -y
fi

read -p 'do we need insecure docker? yes or no?' name
if [ "$name" = "yes" ]; then
  ip=`kkubectl get service -n jx jenkins-x-docker-registry | grep jenkins | awk '{print $3}`
  conf="/etc/systemd/system/docker.service.d/docker.conf"

  mkdir $(dirname $conf)

  echo "[Service]" > $conf
  echo "ExecStart" >> $conf
  echo "ExecStart=/usr/bin/dockerd -H fd:// --insecure-registry $ip:5000" >> $conf

  echo "config file write well, prepare to restart docker"
  systemctl daemon-reload
  service docker restart
fi
