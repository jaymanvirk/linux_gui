# Scripts to setup bloatwareless Linux GUI

## Arch
1. Connect to Wi-Fi network
   1. Use rfkill to check if the wireless adapter is blocked
   ```bash
   rfkill list
   ```
   2. Unblock all (for now)
   ```bash
   rfkill unblock all
   ```
   3. Enter iwctl environment
   ```bash
   iwctl
   ```
   4. List available devices
   ```bash
   station list
   ```
   5. Scan for networks
   ```bash
   station wlan0 scan
   ```
   6. List available networks
   ```bash
   station wlan0 get-networks
   ```
   7. Connect to a network
   ```bash
   station wlan0 connect <SSID_NAME>
   ```
  
2. Start archinstall minimal
```bash
# TODO: add config install
archinstall
```

3. Verify DNS configuration
   1. Open and edit /etc/resolv.conf
   ```bash
   sudo vim /etc/resolv.conf
   ```
   2. Add nameservers
   ```bash
   nameserver 8.8.8.8
   ```
   3. Restart dhcpcd
   ```bash
   sudo systemctl restart dhcpcd
   ```
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

