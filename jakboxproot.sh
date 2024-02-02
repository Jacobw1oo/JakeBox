#!/bin/bash
# JakBox takes the best parts from 4 diffrent proot, chroot setup githubs
# https://github.com/olegos2/mobox
# https://github.com/Ilya114/Box64Droid/
# https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/
# https://github.com/Raezroth/Linux-ARM-Gaming-Chroot

#Part Pre 3 - Debian - Creating scripts directory
mkdir /usr/local/bin/jakbox/
mkdir /usr/local/bin/jakbox/scripts
export JAKSCRIPTS="/usr/local/bin/jakbox/scripts"

#Part 3 - Debian - Installing xfce4
curl -s -o $JAKSCRIPTS/xfce4.sh https://raw.githubusercontent.com/Jacobw1oo/JakBox/main/scripts/xfce4.sh
bash $JAKSCRIPTS/xfce4.sh

#Part 4 - Debian - Adding User
#Username: gamer Password: gamer
curl -s -o $JAKSCRIPTS/addusergamer.sh https://raw.githubusercontent.com/Jacobw1oo/JakBox/main/scripts/addusergamer.sh
bash $JAKSCRIPTS/addusergamer.sh

#Part 5 Pre - Debian user - logining to user
su gamer
# should add id checks here, making sure user is not root user
