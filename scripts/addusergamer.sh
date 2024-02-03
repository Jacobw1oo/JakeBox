#!/bin/bash
#Part 4 - Debian - Adding User
#addusergamer.sh
#Username: gamer Password: gamer
set -e

# Adding user
useradd -U -m -s /bin/bash gamer -p gamer

# Making sure sudo is installed
apt install -y sudo
# Adding them to admin sudoers file
echo "gamer  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Creating the the home user folders, idk why there not auto made
mkdir /home/gamer/Desktop
mkdir /home/gamer/Documents
mkdir /home/gamer/Downloads
mkdir /home/gamer/Music
mkdir /home/gamer/Pictures
mkdir /home/gamer/Videos

# adding the user to groups
usermod -a -G audio gamer
usermod -a -G video gamer
groupadd wheel
usermod -a -G wheel gamer
groupadd storage
usermod -a -G storage gamer
