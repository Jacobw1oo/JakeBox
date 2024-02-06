#!/bin/bash
#toontownrewirtteninstall.sh
#Part 13 - Debian user - compiling and installing gl4es
echo "Part 13 - Debian user - installing toontown rewritten"

#Installing flatpak package manager
sudo apt install -y flatpak

#start dbus session
dbus-run-session
sudo dbus-run-session

#using and fixing flatpak
sudo dbus-launch flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepohub.flatpak
sudo dbus-launch flatpak install flathub

#installing tooontown
cd ~/Downloads
wget https://cdn.toontownrewritten.com/launcher/linux/launcher.flatpakref
#Installing flatpak for amd64 not (AArch64)
sudo dbus-launch flatpak --arch=x86_64  install launcher.flatpakref

#Note you need to use box64 or box86 to start app
