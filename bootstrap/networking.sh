#!/bin/sh

set -xe

TARGET_HOSTNAME="raspberrypi"

cat <<EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
  
hostname ${TARGET_HOSTNAME}  
EOF

# avahi
apk add --no-cache avahi
