# Scripts to setup bloatwareless Linux GUI

## Debian Desktop

After installing [Debian Desktop](https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/), clone this repo and then:

1. Update /etc/apt/sources.list
```bash
deb https://deb.debian.org/debian bookworm main non-free-firmware
deb-src https://deb.debian.org/debian bookworm main non-free-firmware

deb https://security.debian.org/debian-security bookworm-security main non-free-firmware
deb-src https://security.debian.org/debian-security bookworm-security main non-free-firmware

deb https://deb.debian.org/debian bookworm-updates main non-free-firmware
deb-src https://deb.debian.org/debian bookworm-updates main non-free-firmware
```
2. Update-upgrade
```bash
sudo apt update && sudo apt upgrade -y
```
3. Install Wi-Fi drivers
    1. List your wireless network hardware
    ```bash
    lspci -nnk | grep -A2 0280
    ```


## License
This project is licensed under the MIT License.

