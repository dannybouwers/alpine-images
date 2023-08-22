#!/bin/sh

#---help---
# Usage: 00-kernel-rpi.sh <device_name>
#
# Prepare kernel for booting on Raspberry Pi
#
# Example:
#   enter-chroot /bootstrap/00-kernel.sh mmcblk0
#
# Arguments:
#   <device_name>   Mandatory device reference. Partition numbers are added by the script. eg mmcblk0 for RPi SD-card
#---help---

DEVICE_NAME="${1}"
[ "$DEVICE_NAME" != "${DEVICE_NAME#mmc}" ] && PARTITION_PREFIX="p" || PARTITION_PREFIX=""

set -xe

echo "modules=loop,squashfs,sd-mod,usb-storage root=/dev/${DEVICE_NAME}${PARTITION_PREFIX}2 rootfstype=ext4 elevator=deadline fsck.repair=yes console=tty1 rootwait quiet" > /boot/cmdline.txt

cat <<EOF > /boot/config.txt
[pi02]
kernel=vmlinuz-rpi
initramfs initramfs-rpi
[pi3]
kernel=vmlinuz-rpi
initramfs initramfs-rpi
[pi3+]
kernel=vmlinuz-rpi
initramfs initramfs-rpi
[pi4]
enable_gic=1
kernel=vmlinuz-rpi4
initramfs initramfs-rpi4
[all]
arm_64bit=1
include usercfg.txt
EOF
  
cat <<EOF > /boot/usercfg.txt
dtoverlay=disable-wifi
dtoverlay=disable-bt
EOF

# fstab
cat <<EOF > /etc/fstab
/dev/${DEVICE_NAME}${PARTITION_PREFIX}1  /boot           vfat    defaults          0       2
/dev/${DEVICE_NAME}${PARTITION_PREFIX}2  /               ext4    defaults,noatime  0       1
EOF

apk add --no-cache linux-rpi linux-rpi4 raspberrypi-bootloader