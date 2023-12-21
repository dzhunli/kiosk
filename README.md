
# KIOSK

debian-based kiosk distro

### License

[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)



## Features and benefits

- Easy configure && create custom ISO 
- Automated installation
- Debian12 based
- **Support WEBGL** 
- ssh included (default root pass *changeme*)
## FUTURE
- *Openvpn\wireguard* clients will be added for the possibility of remote control of the kiosk
- Recognition and identification of each kiosk will be added for the convenience of remote management
## Installation

- clone repository
- download debian as a base distro in repository directory [Debian12-bookworm-netinstall-amd64](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso)
- make sure that you modify **./SCRIPTS/preseed/preseed.cfg** as your neeed
- make sure that you modify  **./SCRIPTS/preseed/postinst.sh** as your need 
    - in line of  **./SCRIPTS/preseed/postinst.sh** 39 set your url to show in kiosk
    - in line 6 **./SCRIPTS/preseed/postinst.sh** modify value *custom_port* it is port for ssh
- make sure that in project dir you have correct base distro
- run the command below
```bash
sudo ./create 
```
Now you can burn the received iso to the drive using such tools as:
- dd https://man7.org/linux/man-pages/man1/dd.1.html
- Rufus https://rufus.ie
- balenaEtcher https://etcher.balena.io/

## DEMO OF INSTALLING
![App video](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


### Authors

- [@dzhunli](https://github.com/dzhunli)


### Documentation

[Debian pressed](https://www.debian.org/releases/stable/s390x/apbs02.en.html)

[WEBGL on linux](https://forum.onshape.com/discussion/19653/chrome-linux-webgl)
