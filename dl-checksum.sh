#!/usr/bin/env sh
VER=${1:-v3.4.2}
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
    local os=$1
    local arch=$2
    local archive_type=$3
    local platform="${os}-${arch}"
    local file=etcd-${VER}-${platform}.${archive_type}
    local url=$MIRROR/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $LSHASUM | awk '{print $1}')
}

printf "  # %s\n" $RSHASUM
printf "  %s:\n" $VER
dl darwin amd64 zip
dl linux amd64 tar.gz
dl linux arm64 tar.gz
dl linux ppc64le tar.gz
dl windows amd64 zip
