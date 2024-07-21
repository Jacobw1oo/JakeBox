#!/bin/sh
#designed to fix issue at root user level
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "127.0.0.1 localhost" > /etc/hosts
apt update

groupadd -g 3001 aid_bt
groupadd -g 3002 aid_bt_net
groupadd -g 3003 aid_inet
groupadd -g 3004 aid_net_raw
groupadd -g 3005 aid_admin

usermod -a -G 3003 root
usermod -a -G 3003 _apt
usermod -g 3003 _apt

#fixes user issue later
chmod 755 /
chmod 755 /bin
chmod 755 /lib

chmod 777 /tmp

#Mesa Update
apt-get install software-properties-common
add-apt-repository ppa:mastag/mesa-turnip-kgsl
dpkg --add-architecture armhf # enable installation of armhf libraries
apt update
apt upgrade

