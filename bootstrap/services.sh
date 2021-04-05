#!/bin/sh

set -xe

for service in devfs dmesg mdev; do
	rc-update add $service sysinit
done

for service in modules sysctl hostname bootmisc swclock syslog swap networking urandom; do
	rc-update add $service boot
done

for service in acpid sshd chronyd avahi-daemon; do
	rc-update add $service default
done

for service in mount-ro killprocs savecache; do
	rc-update add $service shutdown
done
