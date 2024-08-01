#!/bin/bash

unset LD_PRELOAD
su -c "settings put global settings_enable_monitor_phantom_procs false"

export ROOTFSPATH=~/ubuntu

sudo mkdir $ROOTFSPATH/dev/shm
sudo chmod 777 $ROOTFSPATH/dev/shm

sudo mkdir $PREFIX/tmp/.X11-unix
sudo chmod 777 $PREFIX/tmp/.X11-unix

sudo mount -o remount,dev,suid /data
sudo mount --bind $ROOTFSPATH $ROOTFSPATH
sudo mount proc -t proc $ROOTFSPATH/proc
sudo mount sys -t sysfs $ROOTFSPATH/sys
sudo mount --bind /dev $ROOTFSPATH/dev
sudo mount --bind /dev/pts $ROOTFSPATH/dev/pts
sudo mount --bind /sdcard $ROOTFSPATH/sdcard
sudo mount -t tmpfs tmpfs $ROOTFSPATH/dev/shm
echo "Starting Termux-x11..."
setenforce 0
kill -9 $(pgrep -f "termux.x11") 2>/dev/null
pulseaudio --verbose --start --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"
termux-x11 :0 -ac -extension MIT-SHM &
sleep 2
echo ""
    echo -e "Termux-x11 started"
echo ""
sudo mount --bind $PREFIX/tmp/.X11-unix $ROOTFSPATH/tmp/.X11-unix
echo "Starting Jakebox"
    echo ""
sudo chroot $ROOTFSPATH /bin/su -
sudo umount $ROOTFSPATH/proc
sudo umount $ROOTFSPATH/sys
sudo umount $ROOTFSPATH/dev/pts
sudo umount $ROOTFSPATH/dev
sudo umount $ROOTFSPATH/sdcard
sudo umount $ROOTFSPATH/tmp/.X11-unix
