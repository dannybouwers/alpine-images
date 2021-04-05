# Alpine Raspberry PI

This is a system install of Alpine linux for Raspberry Pi 3B, 3B+ and 4 image ready to burn to an SD card via [balenaEtcher](https://www.balena.io/etcher/) (there's no need to gunzip image).

The image automatically setup and configures:

* root user [pwd: changeme]
* ~pi user [pwd: raspberry]~
* ethernet
* wifi (edit `wpa_supplicant.conf` in the boot partition, on first boot it will be copied)
* bluetooth
* avahi
* swap
* openssh server
* root partition auto-expand on first boot

## Purpose of the fork

- [ ] Make the Raspberry Pi image as minimal as possible
  - [ ] Remove WiFi
  - [ ] Remove Bluetooth
  - [ ] Minimize installed packages
  - [x] Remove SUDO
  - [x] Remove pi-user
- [ ] Build Google Cloud image
- [ ] Enable SSH login
- [ ] Parametrize build
  - [ ] Timezone
  - [ ] Keyboard layout
  - [ ] Root password