# Alpine Raspberry PI
This Alpine Linux image is ready to flash to an SD card for Raspberry Pi 3B, 3B+ and 4 and headless usage (i.e. without connected screen and keyboard). It is configured to be as close to Alpine Standard as possible. Additional packages, features (e.g Bluetooth, WiFi) or configuration (e.g. users) can be added via SSH access.

Download the ready build image via the [Releases section](https://github.com/dannybouwers/alpine-raspberry-pi/releases/latest)

[![Downloads](https://img.shields.io/github/downloads/dannybouwers/alpine-raspberry-pi/total)](https://github.com/dannybouwers/alpine-raspberry-pi/releases/latest)
[![Workflow status](https://img.shields.io/github/workflow/status/dannybouwers/alpine-raspberry-pi/build-release-latest)](https://github.com/dannybouwers/alpine-raspberry-pi/actions/workflows/main.yml)

## Features
The image is configured with:

* root user (password: changeme) with ssh
* ethernet (auto DHCP)
* SWAP file of 1G
* openssh server
* root partition auto-expand on first boot

> :warning: **Insecure image**: root login with SSH access is convenient for further setup, but also a security risk. Change the password and disable root SSH ASAP.

## Flashing
Flashing is tested using [Raspberry Pi Imager](https://www.raspberrypi.org/software/). It isn't necessary to extract the gz-archive.

## Purpose of the fork (and to-do)

- [x] Make the Raspberry Pi image as minimal and close to original as possible
  - [x] Remove WiFi
  - [x] Remove Bluetooth
  - [x] Minimize installed packages
  - [x] Remove SUDO
  - [x] Remove pi-user
- [x] Enable SSH login
- [ ] Parametrize build
  - [ ] Timezone
  - [ ] Keyboard layout
  - [ ] Root password
  - [x] Installation device name
  - [ ] SWAP size
