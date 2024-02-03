#!/bin/bash
# jakebox uses some of the best parts from 4 diffrent proot, chroot setup githubs
# https://github.com/olegos2/mobox
# https://github.com/Ilya114/Box64Droid/
# https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/
# https://github.com/Raezroth/Linux-ARM-Gaming-Chroot

#TODO MENU all menus should be at the top#
echo "Welcome to debian proot installer"

#start up on Debian - Creating scripts directory
mkdir /usr/local/bin/jakebox/
mkdir /usr/local/bin/jakebox/scripts
export JAKESCRIPTS="/usr/local/bin/jakebox/scripts"

#Part 4 - Debian - Installing xfce4
curl -s -o $JAKESCRIPTS/xfce4.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/xfce4.sh
bash $JAKESCRIPTS/xfce4.sh

#Part 5 - Debian - Adding User
#Username: gamer Password: gamer
curl -s -o $JAKESCRIPTS/addusergamer.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/addusergamer.sh
bash $JAKESCRIPTS/addusergamer.sh
su gamer
# should add id checks here, making sure user is not root user

#Part 6 - Debian User - Installing lots of packages
curl -s -o $JAKESCRIPTS/debianpackages.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/debianpackages.sh
bash $JAKESCRIPTS/debianpackages.sh

#Part 7 - Debian User - Installing mesa turnip zink GPU drivers (having issues hte deb created is not compatable)
curl -s -o $JAKESCRIPTS/turnipmesa23-3.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/turnipmesa23-3.sh
bash $JAKESCRIPTS/turnipmesa23-3.sh

#Part 7 - Debian User - Installing mesa turnip zink GPU drivers (having issues hte deb created is not compatable)
#curl -s -o $JAKESCRIPTS/turnipmesa24-1.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/turnipmesa24-1.sh
#bash $JAKESCRIPTS/turnipmesa24-1.sh

#Part 8 - Debian user - compiling and installing gl4es
curl -s -o $JAKESCRIPTS/gl4es.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/gl4es.sh
bash $JAKESCRIPTS/gl4es.sh

#Part 9 - Debian User - box86&box64 
#TODO MENU all menus should be at the top#

#Part 9 - Debian User - Installing box86-box64 from debian repo
#curl -s -o $JAKESCRIPTS/box8664apt.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/box8664apt.sh
#bash $JAKESCRIPTS/box8664apt.sh

#Part 9 - Debian User - Compiling and Installing box86-box64
#curl -s -o $JAKESCRIPTS/box8664compile.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/box8664compile.sh
#bash $JAKESCRIPTS/box8664compile.sh

#Part 9 - Debian User - Compiling and Installing box86-box64 for snapdragon
curl -s -o $JAKESCRIPTS/box8664snapdragon.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/box8664snapdragon.sh
bash $JAKESCRIPTS/box8664snapdragon.sh

#Part 10 - Debian User - Install the frist Wine
curl -s -o $JAKESCRIPTS/wine91.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/wine91.sh
bash $JAKESCRIPTS/wine91.sh
echo "Part 10 - Done"
