#!/bin/sh

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

read -p 'do we need clean first? yes or no?' name
if [ "$name" = "yes" ]; then
  curl http://get.alauda.cn/deploy/ake/cleanup | bash
fi

read -p 'do we need install docker first? yes or no?' name
if [ "$name" = "yes" ]; then
  curl https://raw.githubusercontent.com/LinuxSuRen/getGo/master/jx-docker.sh | bash
fi

echo "-------- start downloading ---------------------'
rm -rfv ake
wget http://get.alauda.cn/deploy/ake/ake
chmod u+x ake

echo "-------- start install ---------------------'
./ake up --cert-sans $1

rm -rfv ake
