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

flatpak remote-ls --all --arch=i386  temp

#installing tooontown
cd ~/Downloads
wget https://cdn.toontownrewritten.com/launcher/linux/launcher.flatpakref
#Installing flatpak for amd64 not (AArch64)
sudo dbus-launch flatpak install launcher.flatpakref
#appling fix to repo
flatpak remote-ls --all --arch=i386 launcher-origin
#Note you need to use box64 or box86 to start app
