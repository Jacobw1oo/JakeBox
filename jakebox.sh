#!/bin/bash
# JakeBox uses some of the best parts from 4 diffrent proot, chroot setup githubs
#Username: gamer Password: gamer
#Thanks below
# https://github.com/olegos2/mobox
# https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/
# https://github.com/xDoge26/proot-setup
# https://github.com/Ilya114/Box64Droid/
# https://github.com/Raezroth/Linux-ARM-Gaming-Chroot

# Had to be broken up into 3 phase due to diffrent systems and users
phase=$1

#Todo make a pick menu

# Had to be broken up into 3 phase do to diffrent systems and users
if [ $phase -eq 1 ]; then 
echo "Phase 1 selected" 
sleep 3 
echo "Installing JakeBox"
echo "Estimated time to completion is 20 minuties"
echo "-------------------------------------------"

#Part 1 - Termux - Installing proot-debian
echo "Part 1 - Termux - Installing proot-debian"

#termux-change-repo greatly increases chance that the termux installs will work, i dont know why packages struggle from termux
termux-change-repo

# Start of installings
echo "allow-external-apps = true" >> ~/.termux/termux.properties 
echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties
pkg clean && termux-setup-storage && yes | pkg update && pkg install nano wget proot-distro pulseaudio -y && pkg clean && proot-distro install debian && proot-distro clear-cache

#adding startup and start commands (had an issue with triple nested quotes )
echo 'pulseaudio --verbose --start --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"' >> ~/.bashrc
echo 'alias jakeboxgamer="proot-distro login debian --user gamer --shared-tmp --no-sysvipc" ' >> ~/.bashrc
echo 'alias jakeboxroot="proot-distro login debian --user root --shared-tmp --no-sysvipc" ' >> ~/.bashrc

echo proot-distro login debian --user gamer --shared-tmp -- bash -c 'termux-x11 :0 -xstartup "dbus-launch --exit-with-session xfce4-session"' > ~/jakebox
chmod +x ~/jakebox
echo proot-distro login debian --user gamer --shared-tmp --no-sysvipc -- bash -c 'termux-x11 :0 -xstartup "dbus-launch --exit-with-session xfce4-session"' > ~/jakeboxsys
chmod +x ~/jakeboxsys

# read bashrc to terminal and reloads settings
cat ~/.bashrc && termux-reload-settings
echo "Part 1 - Done"

#Todo make a pick menu

#Part 2 - Termux - Installing VirGL Zink
echo "Part 2 - Termux - Installing VirGL Zink"

pkg install x11-repo tur-repo -y
pkg install mesa-zink virglrenderer-mesa-zink -y

echo 'alias zink="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy virgl_test_server --use-egl-surfaceless --use-gles &"' >> ~/.bashrc
echo 'zink' >> ~/.bashrc
source ~/.bashrc
echo "Part 2 - Done"

#Part 2.1 - Termux - Installing  VirGL ES - Disabled
#pkg install x11-repo
#pkg install virglrenderer-android

echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android &"' >> ~/.bashrc
#source ~/.bashrc

#Part Pre 3 - Termux - prep for xfce4
echo "Part 3 - Termux - prep for xfce4 & loading into proot"
pkg update
pkg install x11-repo -y
pkg install termux-x11-nightly -y
pkg install xfce -y

#Part Pre 3 - Termux - Loading into proot
#loads into proot and continues the script at jakebox
echo "Part 3 - Done"
# this starts phase 2
proot-distro login debian --user root --shared-tmp --no-sysvipc -- bash -c "curl -s -o ~/jakebox.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/jakebox.sh; . ~/jakebox.sh 2"
#exit

elif [ $phase -eq 2 ]; then 
echo "Phase 2 selected" 
sleep 3 
#start up on Debian - Creating scripts directory
mkdir /usr/local/bin/jakebox/
mkdir /usr/local/bin/jakebox/scripts
mkdir /usr/local/bin/jakebox/packages
export JAKESCRIPTS="/usr/local/bin/jakebox/scripts"

#Part 4 - Debian - Installing xfce4
curl -s -o $JAKESCRIPTS/xfce4.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/xfce4.sh
bash $JAKESCRIPTS/xfce4.sh

#Part 5 - Debian - Adding User
#Username: gamer Password: gamer
curl -s -o $JAKESCRIPTS/addusergamer.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/addusergamer.sh
bash $JAKESCRIPTS/addusergamer.sh
# changing user to gamer and continuing with installaztion
#su gamer -c "curl -s -o ~/jakebox.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/jakebox.sh; . ~/jakebox.sh 3"
# should add id checks here, making sure user is not root user
#exit

elif [ $phase -eq 3 ]; then
echo "Phase 3 selected" 
export JAKESCRIPTS="/usr/local/bin/jakebox/scripts"
sleep 3 
#Part 6 - Debian User - Installing lots of packages
curl -s -o $JAKESCRIPTS/debianpackages.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/debianpackages.sh
bash $JAKESCRIPTS/debianpackages.sh

#Part 7 
#mesa-vulkan-kgsl_24.1.0 (arm64 - segmentation fault, armhf - Incompatible driver armhf)
#mesa-vulkan-kgsl_23.3.0-1 - 20230812 (both segmentation fault)
#mesa-vulkan-kgsl_23.3.0-2 - 20230803 (both segmentation fault)
#mesa-vulkan-kgsl_23.3.0-devel-20230910_debian_arm64.deb (untested)
#mesa-vulkan-kgsl_24.1.0-devel-20240120_arm64.deb (works)

#idea
#MESA_LOADER_DRIVER_OVERRIDE=zink TU_DEBUG=noconform MESA_GL_VERSION_OVERRIDE=4.6COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 LD_LIBRARY_PATH=/path/to/gl4es dbus-launch --exit-with-session startxfce4

#Part 7 - Debian User - Installing mesa turnip zink GPU drivers (having issues hte deb created is not compatable)
#curl -s -o $JAKESCRIPTS/turnipmesa23-3.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/turnipmesa23-3.sh
#bash $JAKESCRIPTS/turnipmesa23-3.sh

#Part 7 - Debian User - Installing mesa turnip zink GPU drivers (having issues hte deb created is not compatable)
curl -s -o $JAKESCRIPTS/turnipmesa24-1.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/turnipmesa24-1.sh
bash $JAKESCRIPTS/turnipmesa24-1.sh

#Part 8 - Debian user - compiling and installing gl4es
curl -s -o $JAKESCRIPTS/gl4es.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/gl4es.sh
bash $JAKESCRIPTS/gl4es.sh

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

#Part 11 - Debian User - Installing firefox, playonlinux, Lutris
curl -s -o $JAKESCRIPTS/linuxapps.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/linuxapps.sh
bash $JAKESCRIPTS/linuxapps.sh

#Part 12 - Debian User - Installing steam
curl -s -o $JAKESCRIPTS/steaminstall.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/steaminstall.sh
bash $JAKESCRIPTS/steaminstall.sh

#Part 13 - Debian User - Compiling and Installing Heroic Games Lanucher
curl -s -o $JAKESCRIPTS/heroiccompile.sh https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/scripts/heroiccompile.sh
bash $JAKESCRIPTS/heroiccompile.sh
else
echo "Defaulted to Phase 1" 
sleep 3 
fi #end
