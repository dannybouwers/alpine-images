#!/bin/sh

set -xe

TARGET_HOSTNAME="raspberrypi"
TARGET_PASSWORD="changeme"
TARGET_TIMEZONE="Europe/Amsterdam"
TARGET_LOCALE="us-us"
LAYOUT="$( cut -d '-' -f 1 <<< "$LOCALE" )";
LAYOUT_SPEC="$( cut -d '-' -f 2 <<< "$LOCALE" )";


# base stuff
apk add --no-cache ca-certificates
update-ca-certificates
echo "root:${TARGET_PASSWORD}" | chpasswd
setup-hostname ${TARGET_HOSTNAME}
setup-keymap $LAYOUT $LAYOUT_SPEC

# time
apk add --no-cache chrony tzdata
setup-timezone -z ${TARGET_TIMEZONE}
