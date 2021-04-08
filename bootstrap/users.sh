#!/bin/sh

set -xe

for GRP in spi i2c gpio; do
	addgroup --system $GRP
done

# enable root ssh
apk add --no-cache openssh
sed -i 's|^PermitRootLogin .*$|PermitRootLogin yes|g' /etc/ssh/sshd_config