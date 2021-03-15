#!/bin/bash
# set up remote desktop on ubuntu/debian based OSes

echo "Installing prerequisites"
sudo apt update
sudo apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils

echo "Adding new user 'xrdp' to the 'ssl-cert' group"
sleep 2;
sudo adduser xrdp ssl-cert


echo "Configuring firewall to allow connections from within internal network"
sudo ufw allow from 192.168.1.0/24 to any port 3389
sudo ufw allow 3389