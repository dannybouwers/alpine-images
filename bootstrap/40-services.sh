#!/bin/sh

set -xe

rc-update --quiet add networking boot
rc-update --quiet add seedrng boot || rc-update --quiet add urandom boot
svc_list="cron crond"
if [ -e /dev/input/event0 ]; then
	# Only enable acpid for systems with input events entries
	# https://gitlab.alpinelinux.org/alpine/aports/-/issues/12290
	svc_list="$svc_list acpid"
fi
for svc in $svc_list; do
	if rc-service --exists $svc; then
		rc-update --quiet add $svc
	fi
done

rc-update --quiet add swap boot