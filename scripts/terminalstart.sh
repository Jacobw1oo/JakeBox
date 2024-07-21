#!/bin/bash

unset LD_PRELOAD
su -c "settings put global settings_enable_monitor_phantom_procs false"

export ROOTFSPATH=~/chroot

sudo mount -o remount,dev,suid /data
sudo mount proc -t proc $ROOTFSPATH/proc
sudo mount sys -t sysfs $ROOTFSPATH/sys
sudo mount --bind /dev $ROOTFSPATH/dev
sudo mount --bind /dev/pts $ROOTFSPATH/dev/pts
sudo mount --bind /sdcard $ROOTFSPATH/sdcard
echo "Starting Termux-x11..."
termux-x11 :0 &>/dev/null & pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 &>/dev/null & sleep 1
echo ""
    echo -e "Termux-x11 started"
echo ""
sudo mount --bind $PREFIX/tmp/.X11-unix $ROOTFSPATH/tmp/.X11-unix
echo "Starting Box64Droid..."
    echo ""
sudo chroot $ROOTFSPATH /bin/su -
sudo umount $ROOTFSPATH/proc
sudo umount $ROOTFSPATH/sys
sudo umount $ROOTFSPATH/dev/pts
sudo umount $ROOTFSPATH/dev
sudo umount $ROOTFSPATH/sdcard
sudo umount $ROOTFSPATH/tmp/.X11-unix
