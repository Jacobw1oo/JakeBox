#!/bin/bash
# jakebox uses some of the best parts from 4 diffrent proot, chroot setup githubs
# https://github.com/olegos2/mobox
# https://github.com/Ilya114/Box64Droid/
# https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/
# https://github.com/Raezroth/Linux-ARM-Gaming-Chroot

#TODO MENU all menus should be at the top#

#Part Pre 3 - Debian - Creating scripts directory
mkdir /usr/local/bin/jakebox/
mkdir /usr/local/bin/jakebox/scripts
export JAKESCRIPTS="/usr/local/bin/jakebox/scripts"

#Part 3 - Debian - Installing xfce4
curl -s -o $JAKESCRIPTS/xfce4.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/xfce4.sh
bash $JAKESCRIPTS/xfce4.sh

#Part 4 - Debian - Adding User
#Username: gamer Password: gamer
curl -s -o $JAKESCRIPTS/addusergamer.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/addusergamer.sh
bash $JAKESCRIPTS/addusergamer.sh

#Part 5 Pre - Debian user - logining to user
su gamer
# should add id checks here, making sure user is not root user

#Part 5 Pre - Debian User - Installing lots of packages
curl -s -o $JAKESCRIPTS/box8664apt.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/box8664apt.sh
bash $JAKESCRIPTS/box8664apt.sh

#Part 5 - Debian User - Installing turnip v4 GPU drivers
curl -s -o $JAKESCRIPTS/turnipmesa24-1.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/turnipmesa24-1.sh
bash $JAKESCRIPTS/turnipmesa24-1.sh

#Part 6 - Debian User - box86&box64 
#TODO MENU all menus should be at the top#

#Part 6 - Debian User - Installing box86-box64 from debian repo
#curl -s -o $JAKESCRIPTS/debianpackages.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/debianpackages.sh
#bash $JAKESCRIPTS/debianpackages.sh

#Part 6 - Debian User - Compiling and Installing box86-box64
#curl -s -o $JAKESCRIPTS/box8664compile.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/box8664compile.sh
#bash $JAKESCRIPTS/box8664compile.sh

#Part 6 - Debian User - Compiling and Installing box86-box64 for snapdragon
curl -s -o $JAKESCRIPTS/box8664snapdragon.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/box8664snapdragon.sh
bash $JAKESCRIPTS/box8664snapdragon.sh

#Part 7 - Debian User - Install the frist Wine
curl -s -o $JAKESCRIPTS/wine91.shhttps://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/wine91.sh
bash $JAKESCRIPTS/wine91.sh
