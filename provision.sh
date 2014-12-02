#!/usr/bin/env bash

export LFS=/mnt/lfs

# Check if partitions exists if not create
if [ `fdisk -l /dev/sdb | grep /dev/sdb | sed '/^Disk /d' | sed 's/^\([^ ]*\)  *.*/\1/' | wc -l` = 0 ]
then
    echo "Creating partitions for LFS..."
sfdisk /dev/sdb << EOF
0,20,L,*
,,E
;
;
,,L
EOF
    echo "Partitions created"

    # Create filesystem for LFS partition
    echo "Creating filesystem for LFS..."
    mkfs -v -t ext2 /dev/sdb1
    mkfs -v -t ext4 /dev/sdb5
    mkdir -pv $LFS
    mkdir -pv $LFS/boot
    echo "Filesystem created"
else
    echo "[Skipping] The LFS filesystem is already created"
fi

if [ `mount -l | grep /dev/sdb | wc -l` = 0 ]
then
    mount -v -t ext2 /dev/sdb1 $LFS/boot
    mount -v -t ext4 /dev/sdb5 $LFS
else
    echo "[Skipping] LFS partitions are already mounted"
fi
