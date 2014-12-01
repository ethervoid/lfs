#!/usr/bin/env bash

export LFS=/mnt/lfs

# Check if partitions exists if not create
sfdisk /dev/sdb << EOF
0,20,L,*
,,E
;
;
,,L
EOF

# Create filesystem for LFS partition
mkfs -v -t ext2 /dev/sdb1
mkfs -v -t ext4 /dev/sdb5

mkdir -pv $LFS
mkdir -pv $LFS/boot
mount -v -t ext2 /dev/sdb1 $LFS/boot
mount -v -t ext4 /dev/sdb5 $LFS
