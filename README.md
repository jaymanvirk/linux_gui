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
archinstall --config /path/to/your/config.json
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
## License
This project is licensed under the MIT License.

