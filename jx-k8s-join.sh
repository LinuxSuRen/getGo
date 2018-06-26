#!/bin/sh

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

curl http://get.alauda.cn/deploy/ake/cleanup | bash

rm -rfv ake

wget http://get.alauda.cn/deploy/ake/ake

chmod u+x ake
./ake join --apiserver $1:6443

rm -rfv ake