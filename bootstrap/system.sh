#!/bin/sh

set -xe

TARGET_HOSTNAME="raspberrypi"
TARGET_PASSWORD="changeme"
TARGET_TIMEZONE="Europe/Amsterdam"
TARGET_LOCALE="us-us"
LAYOUT=$(echo $LOCALE | cut -d'-' -f 1);
LAYOUT_SPEC=$(echo $LOCALE | cut -d'-' -f 2);


# base stuff
apk add --no-cache ca-certificates
update-ca-certificates

# password
echo "root:${TARGET_PASSWORD}" | chpasswd

# hostname
setup-hostname "${TARGET_HOSTNAME}"

# keymap
setup-keymap "${LAYOUT}" "${LAYOUT_SPEC}"

# time
apk add --no-cache chrony tzdata
setup-timezone -z "${TARGET_TIMEZONE}"
rc-update add swclock boot
rc-update add chronyd default