#!/bin/bash

# Remove Ubuntu Software Center
echo "Removing Ubuntu Software Center..."
sudo snap remove snap-store -y

# Remove unnecessary applications
echo "Removing unnecessary applications..."
sudo apt remove --purge -y gnome-software
sudo apt autoremove -y

# Install SD card drivers for Mac hardware
echo "Installing SD card drivers..."
sudo apt install -y exfat-fuse exfat-utils

# Improve boot-up speed
echo "Improving boot-up speed..."
# Lower the timeout grub configuration
sudo sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=2/' /etc/default/grub
sudo update-grub

echo "Script execution completed."
