#!/bin/bash

#DEPRICATED, no longer used

#toontownrewirtteninstall.sh
#Part 13 - Debian user - compiling and installing gl4es
echo "Part 13 - Debian user - installing toontown rewritten"

#Installing flatpak package manager
sudo apt install -y flatpak

#start dbus
mkdir /run/dbus
dbus-daemon --system
sudo dbus-launch

#using and fixing flatpak
sudo dbus-launch flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepohub.flatpak
sudo dbus-run-session flatpak install flathub

#installing tooontown
cd ~/Downloads
wget https://cdn.toontownrewritten.com/launcher/linux/launcher.flatpakref
#Installing flatpak for amd64 not (AArch64)
sudo dbus-launch flatpak --arch=x86_64  install launcher.flatpakref

#Note you need to use box64 or box86 to start app
