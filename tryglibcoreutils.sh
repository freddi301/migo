#!/bin/sh

mkdir chroot
mkdir work
mkdir changes
mount -t overlay overlay -o lowerdir=/pkg/glibc-2.21-usrprefix:/pkg/coreutils-8.24:/, workdir=/work,upperdir=/changes /chroot

echo 'type chroot chroot /bin/sh'
