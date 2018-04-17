#!/usr/bin/env bash

if [ ! -d "$GOPATH" ];then
    echo "GOPATH does not exist"
    exit 1;
else
    if [ ! -d "$GOPATH/src/golang.org/x" ];then
        mkdir -p $GOPATH/src/golang.org/x
    fi
fi

cd $GOPATH/src/golang.org/x

if [ ! -d "$GOPATH/src/golang.org/x/net" ];then
    git clone https://github.com/golang/net
fi
if [ ! -d "$GOPATH/src/golang.org/x/sys" ];then
    git clone https://github.com/golang/sys
fi
if [ ! -d "$GOPATH/src/golang.org/x/image" ];then
    git clone https://github.com/golang/image
fi
if [ ! -d "$GOPATH/src/golang.org/x/sync" ];then
    git clone https://github.com/golang/sync
fi
if [ ! -d "$GOPATH/src/golang.org/x/text" ];then
    git clone https://github.com/golang/text
fi