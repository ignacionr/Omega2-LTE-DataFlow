#!/bin/bash

# Install necessary packages
apt-get install -y qemu-system-mips wget unzip squashfs-tools

# Create the /mnt directory if it doesn't exist
mkdir -p /mnt

# Ensure /mnt is empty and accessible
umount /mnt || true
rm -rf /mnt/*
chmod 755 /mnt

# Download OpenWRT Images
rm -f openwrt-23.05.2-ramips-mt76x8-glinet_vixmini-* || true
wget https://downloads.openwrt.org/releases/23.05.2/targets/ramips/mt76x8/openwrt-23.05.2-ramips-mt76x8-glinet_vixmini-initramfs-kernel.bin
wget https://downloads.openwrt.org/releases/23.05.2/targets/ramips/mt76x8/openwrt-23.05.2-ramips-mt76x8-glinet_vixmini-squashfs-sysupgrade.bin

# Prepare root filesystem
dd if=/dev/zero of=rootfs.img bs=1M count=64
mkfs.ext2 -F rootfs.img

# Mount the filesystem directly
mount -o loop rootfs.img /mnt

# Unsquash the filesystem directly
unsquashfs -f -d /mnt openwrt-23.05.2-ramips-mt76x8-glinet_vixmini-squashfs-sysupgrade.bin
umount /mnt

# Run QEMU with the uImage directly if possible
qemu-system-mips -M malta -kernel openwrt-23.05.2-ramips-mt76x8-glinet_vixmini-initramfs-kernel.bin -hda rootfs.img -append "root=/dev/sda console=ttyS0" -nographic
