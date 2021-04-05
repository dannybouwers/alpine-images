# Alpine Raspberry PI

This is a system install of Alpine linux for Raspberry Pi 3B, 3B+ and 4 image ready to burn to an SD card via [USBImager](https://bztsrc.gitlab.io/usbimager/).

The image automatically setup and configures:

* root user [pwd: changeme] with ssh
* ~pi user [pwd: raspberry]~
* ethernet
* ~wifi (edit `wpa_supplicant.conf` in the boot partition, on first boot it will be copied)~
* ~bluetooth~
* avahi
* swap
* openssh server
* root partition auto-expand on first boot

> :warning: **Insecure image**: root login with SSH access is convenient for further setup, but also a security risk. Change the password and disable root SSH ASAP.

## Purpose of the fork

- [x] Make the Raspberry Pi image as minimal and close to original as possible
  - [x] Remove WiFi
  - [x] Remove Bluetooth
  - [x] Minimize installed packages
  - [x] Remove SUDO
  - [x] Remove pi-user
- [ ] Build Google Cloud image
- [x] Enable SSH login
- [ ] Parametrize build
  - [ ] Timezone
  - [ ] Keyboard layout
  - [ ] Root password
  - [ ] Installation device name