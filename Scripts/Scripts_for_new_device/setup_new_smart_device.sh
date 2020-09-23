#!/bin/bash

# sudo screen /dev/ttyUSB0 115200

# Add file /etc/sys_info with the content:
echo "sunxi_platform    : sun8iw7p1
sunxi_secure      : normal
sunxi_chipid      : unsupported
sunxi_chiptype    : unsupported
sunxi_batchno     : unsupported
sunxi_board_id    : 8(0)
board_manufacturer: FriendlyElec
board_name        : FriendlyElec NanoPi-Duo2" >/etc/sys_info

# Add the directory and configuration file:
mkdir -p /etc/cbjinni/

echo 'Light, ' >/etc/cbjinni/deviceConfigs.txt
#echo 'Blinds, ' > /etc/cbjinni/deviceConfigs.txt  # 'Light,' and 'Light, Light, ' and 'Blinds,' can be used

# Connect device to the wifi
nmcli dev wifi connect wifiSsid password wifiPassword

sudo apt update

# Install snapd:
sudo apt install snapd

#sudo snap install network-manager-dart --edge --devmode  # Privet snap for now
sudo snap install cybear-jinni

sudo apt upgrade

# Change the prosessor sepeed to 1Ghz, armbian-config -> system
# Check if it was fixed https://forum.armbian.com/topic/13993-nanopiduo2-not-booting-after-intense-processing-task/
echo 'armbian-config -> system'

sudo reboot
