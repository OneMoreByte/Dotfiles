#!/bin/zsh

paru -Sy

g='/Version/{print $3}'
d1=$(paru -Qi zfs-dkms-git | gawk "$g")
d2=$(paru -Si zfs-dkms-git | gawk "$g")
u1=$(paru -Qi zfs-utils-git | gawk "$g")
u2=$(paru -Si zfs-utils-git | gawk "$g")

if [[ $d1 == $d2 || $u1 == $u2 ]]; then
	echo "zfs is up to date"
	exit 0
fi

paru -Sy zfs-dkms-git zfs-utils-git \
 --assume-installed zfs-dkms-git=$d1 --assume-installed zfs-dkms-git=$d2 \
 --assume-installed zfs-utils-git=$u1 --assume-installed zfs-utils-git=$u2
