#!/bin/bash

qemu-system-mips -M malta -kernel openwrt-23.05.2-ramips-mt76x8-vmlinux.bin -hda rootfs.img -append "root=/dev/sda console=ttyS0" -nographic
