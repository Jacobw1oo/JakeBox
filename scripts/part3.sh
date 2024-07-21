#!/bin/sh

#installing xfce4 desktop (currenlty has known bug that break it)
apt install xubuntu-desktop

#installing KDE (Kubuntu) desktop
#apt install kubuntu-desktop
#Dont install suggested it 3 hour download (instead of 20 mins), it cost 10 extra Gb aswell.
#apt install kubuntu-desktop --install-suggests

#fixing terminal xfce4 terminal is for xfce4 and konsole is for KDE
apt install xfce4-terminal
#apt install konsole

# change terminal to xfce4 or konsole
update-alternatives --config x-terminal-emulator

#fixes clock - mine is for central time
ln -sf /usr/share/zoneinfo/US/Central /etc/localtime

#creating user
#adds needed groups
groupadd storage
groupadd wheel
#adding user named gamer
useradd -m -g users -G wheel,audio,video,storage -s /bin/bash gamer
#setting password for gamer, password is gamer
echo "setting password for user (gamer). My password is gamer"
read -p "Press enter to continue"
passwd gamer

#fixing sudo
apt install -y nano
echo "add /etc/sudoers"
echo "gamer ALL=(ALL:ALL) ALL"
echo "right below"
echo "root ALL=(ALL:ALL) ALL"
read -p "Press enter to continue"
nano /etc/sudoers

#login
su gamer
cd ~

#end of part1.sh
