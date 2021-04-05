#!/bin/sh

set -xe

for GRP in spi i2c gpio; do
	addgroup --system $GRP
done

# enable root ssh
sed -i 's|^PermitRootLogin no$|PermitRootLogin yes|g' /etc/ssh/sshd_config