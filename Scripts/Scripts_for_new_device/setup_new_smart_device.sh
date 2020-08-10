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
board_name        : FriendlyElec NanoPi-Duo2" > /etc/sys_info

sudo -s
# Add the directory and configuration file:
mkdir /etc/cbjinni/

echo 'Light, Light, ' > /etc/cbjinni/deviceConfigs.txt
#echo 'Blinds, ' > /etc/cbjinni/deviceConfigs.txt  # 'Light,' and 'Blinds,' can be used

# Connect device to the wifi
nmcli dev wifi connect WiFi-ssid password WiFi-password

sudo apt update

# Install snapd:
sudo apt install snapd
# Login into snap account
sudo snap login guyluz11@gmail.com

sudo snap install network-manager-dart --edge --devmode
sudo snap install smart-home --beta --devmode

sudo apt upgrade

# Change the prosessor sepeed to 1Ghz, armbian-config -> system
# Check if it was fixed https://forum.armbian.com/topic/13993-nanopiduo2-not-booting-after-intense-processing-task/
echo 'armbian-config -> system'

sudo reboot
