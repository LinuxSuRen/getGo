#!/bin/sh

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

rm -rfv ake

wget http://get.alauda.cn/deploy/ake/ake

chmod u+x ake
./ake up

rm -rfv ake