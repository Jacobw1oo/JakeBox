#!/bin/bash
#Part 3 - Debian - Installing xfce4
#xfce4.sh

set -e
echo "Installing xfce4 with Termux:X11 Support"

apt update && apt upgrade -y
apt install -y sudo nano wget tzdata dbus-x11 adwaita-icon-theme-full gnome-themes-extra
apt install -y xfce4 xfce4-terminal xfce4-goodies --no-install-recommends --no-install-suggests
apt clean && apt autoremove -y

echo 'taskset -c 4-7 termux-x11 :1 -xstartup startxfce4 2> /dev/null &' > /usr/local/bin/x11

chmod +x /usr/local/bin/x11
