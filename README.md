# Scripts to setup bloatwareless Linux GUI

## Arch
1. Connect to Wi-Fi network
   1. Enter iwctl Environment
   ```bash
   iwctl
   ```
   2. List Available Devices
   ```bash
   station list
   ```
   3. Scan for Networks\
Replace wlan0 with your device name if necessary
   ```bash
   station wlan0 scan
   ```
   4. List Available Networks
   ```bash
   station wlan0 get-networks
   ```
   5. Connect to a Network\
Replace SSID_NAME with the name of your network
   ```bash
   station wlan0 connect "SSID_NAME"
   ```
   6. Enter Wi-Fi password

## Debian Desktop XFCE

After installing [Debian Desktop XFCE](https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/), clone this repo and then:

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
    2. Install drivers for the listed hardware
   ```bash
    # Broadcom
    sudo apt install broadcom-sta-dkms
    ```
    3. Check installation
    ```bash
    # Broadcom
    sudo modprobe wl
    ```
    4. Reboot system to apply drivers
   ```bash
    sudo reboot
    ```
4. Install Wireguard VPN
   ```bash
   sudo apt install wireguard
   ```
6. Install Mullvad browser
   ```bash
   # Download the Mullvad signing key
   sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc

   # Add the Mullvad repository server to apt
   echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
    
   # Install the package
   sudo apt update
   sudo apt install mullvad-browser
   ```
## License
This project is licensed under the MIT License.

