#!/bin/bash
#toontownrewirtteninstall.sh
#Part 13 - Debian user - compiling and installing gl4es
echo "Part 13 - Debian user - installing toontown rewritten"


sudo apt install -y flatpak


sudo dbus-launch flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepohub.flatpak
sudo dbus-launch flatpak install flathub

cd ~/Downloads
wget https://cdn.toontownrewritten.com/launcher/linux/launcher.flatpakref

#Note you need to use box64 or box86 to start app
