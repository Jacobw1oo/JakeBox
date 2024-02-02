#!/bin/bash
#Part 4 - Debian - Adding User
#addusergamer.sh
#Username: gamer Password: gamer
set -e

# Not sure what these do
groupadd storage
groupadd wheel
groupadd video

# Adding user
useradd -U -m -G wheel,audio,video,storage -s /bin/bash gamer -p gamer

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
