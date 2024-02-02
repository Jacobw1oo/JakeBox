#!/bin/bash
# JakeBox uses some of the best parts from 4 diffrent proot, chroot setup githubs
# https://github.com/olegos2/mobox
# https://github.com/Ilya114/Box64Droid/
# https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/
# https://github.com/Raezroth/Linux-ARM-Gaming-Chroot

#Todo make a pick menu


echo "Installing JakeBox"
echo "Estimated time to completion is 20 minuties"
echo "-------------------------------------------"

#Part 1 - Termux - Installing proot-debian
echo "Part 1 - Termux - Installing proot-debian"

# Start of installings
echo "allow-external-apps = true" >> ~/.termux/termux.properties 
echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties
pkg clean && termux-setup-storage && yes | pkg update && pkg install nano wget proot-distro pulseaudio -y && pkg clean && proot-distro install debian && proot-distro clear-cache

#adding startup and start commands
echo "
pulseaudio --verbose --start --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"
alias jakeboxsys="proot-distro login debian --user gamer --shared-tmp --no-sysvipc -- bash -c "termux-x11 :0 -xstartup "dbus-launch --exit-with-session xfce4-session"
alias jakebox="proot-distro login debian --user gamer --shared-tmp -- bash -c "termux-x11 :0 -xstartup "dbus-launch --exit-with-session xfce4-session"
" >> ${MESA_PREFIX}/arm64.txt


# read bashrc to terminal and reloads settings
cat ~/.bashrc && termux-reload-settings
echo "Part 1 - Done"

#Todo make a pick menu

#Part 2 - Termux - Installing VirGL Zink
echo "Part 2 - Termux - Installing VirGL Zink"

pkg install x11-repo tur-repo
pkg install mesa-zink virglrenderer-mesa-zink

echo 'alias zink="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy virgl_test_server --use-egl-surfaceless --use-gles &"' >> ~/.bashrc
source ~/.bashrc
echo "Part 2 - Done"

#Part 2.1 - Termux - Installing  VirGL ES - Disabled
#pkg install x11-repo
#pkg install virglrenderer-android

#echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android &"' >> ~/.bashrc
#source ~/.bashrc

#Part Pre 3 - Termux - prep for xfce4
echo "Part 3 prep - Termux - prep for xfce4 & loading into proot"
pkg update
pkg install x11-repo -Y
pkg install termux-x11-nightly -Y
pkg install xfce -Y

#Part Pre 3 - Termux - Loading into proot
#loads into proot and continues the script at jakeboxproot
proot-distro login debian --user root --shared-tmp --no-sysvipc -- bash -c "curl -s -o ~/jakeboxproot.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/jakeboxproot.sh; bash jakeboxproot.sh"

echo "Part 3 prep - Done"
#Username: gamer Password: gamer

