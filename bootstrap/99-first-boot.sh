#!/bin/sh

#---help---
# Usage: first-boot.sh <device_name>
#
# Generate script to expand second partition on first boot
#
# Example:
#   enter-chroot /bootstrap/first-boot.sh mmcblk0
#
# Arguments:
#   <device_name>   Mandatory device reference. Partition number is added by the script. Eg mmcblk0 for RPi SD-card
#---help---

DEVICE_NAME="${1}"
[ "$DEVICE_NAME" != "${DEVICE_NAME#mmc}" ] && PARTITION_PREFIX="p" || PARTITION_PREFIX=""

set -xe

apk add --no-cache dosfstools e2fsprogs-extra parted

cat <<EOF > /usr/bin/first-boot
#!/bin/sh
set -xe

cat <<PARTED | parted ---pretend-input-tty /dev/${DEVICE_NAME}
unit %
resizepart 2
Yes
100%
PARTED

partprobe
resize2fs /dev/${DEVICE_NAME}${PARTITION_PREFIX}2
rc-update del first-boot
rm /etc/init.d/first-boot /usr/bin/first-boot

fallocate -l 1g /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo "/swapfile       none            swap    sw                0       0" >> /etc/fstab

reboot
EOF

cat <<EOF > /etc/init.d/first-boot
#!/sbin/openrc-run
command="/usr/bin/first-boot"
command_background=false
depend() {
  after modules
  need localmount
}
EOF

chmod +x /etc/init.d/first-boot /usr/bin/first-boot
rc-update --quiet add first-boot
