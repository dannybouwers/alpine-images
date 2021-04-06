#!/bin/sh

#---help---
# Usage: kernel-gce.sh <device_name>
#
# Prepare kernel for booting on Google VM
#
# Example:
#   ./kernel-gce.sh vda
#
# Arguments:
#   <device_name>   Device reference. Partition numbers are added by the script.
#---help---

local DEVICE_NAME
DEVICE_NAME="${1}"

set -xe

# use GRUB
apk del syslinux
apk add --no-cache grub grub-bios

cat <<EOF > /etc/default/grub
GRUB_TERMINAL="serial console"
GRUB_SERIAL_COMMAND="serial --unit=0 --word=8 --parity=no --speed 38400 --stop=1
EOF

grub-install /dev/${DEVICE_NAME}
grub-mkconfig -o  /boot/grub/grub.cfg