#!/usr/bin/env sh
VER=${1:-v3.4.0}
DIR=~/Downloads
MIRROR=https://github.com/etcd-io/etcd/releases/download/$VER
RSHASUM=$MIRROR/SHA256SUMS
LSHASUM=$DIR/etcd-${VER}-SHA256SUMS

if [ ! -e $LSHASUM ];
then
    wget -q -O $LSHASUM $RSHASUM
fi

dl()
{
    OS=$1
    ARCH=$2
    ARCHIVETYPE=$3
    FILE=etcd-${VER}-$OS-$ARCH.$ARCHIVETYPE
    URL=$MIRROR/$FILE
    printf "    # %s\n" $URL
    printf "    sha256:%s\n" $(grep $FILE $LSHASUM | awk '{print $1}')
}

printf "  # %s\n" $RSHASUM
printf "  %s:\n" $VER
dl darwin amd64 zip
dl linux amd64 tar.gz
dl linux arm64 tar.gz
dl linux ppc64le tar.gz
dl windows amd64 zip
