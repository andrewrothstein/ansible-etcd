#!/usr/bin/env sh
VER=v3.3.10
DIR=~/Downloads
MIRROR=https://github.com/etcd-io/etcd/releases/download/$VER
FILE_PREFIX=etcd-$VER

dl()
{
    OSPLAT=$1
    SUFFIX=$2
    FILE=$FILE_PREFIX-$OSPLAT.$SUFFIX
    wget -O $DIR/$FILE $MIRROR/$FILE
}

dl darwin-amd64 zip
dl linux-amd64 tar.gz
dl linux-arm64 tar.gz
dl linux-ppc64le tar.gz
dl windows-amd64 zip

sha256sum $DIR/${FILE_PREFIX}*

