#!/bin/bash
#steaminstall.sh
#Part 12 - Debian User - installing steam
echo "Part 12 - Debian User - Installing steam"

# Installing dependencies
apt install -y binutils xterm file zenity pciutils libcairo2 libcairo2:armhf libxdamage1 libxdamage1:armhf libjpeg-dev libjpeg-dev:armhf libselinux1 libselinux1:armhf libgl1-mesa-glx libgl1-mesa-glx:armhf libogg-dev libogg-dev:armhf libvorbis-dev libvorbis-dev:armhf libice6 libice6:armhf libxss1 libxss1:armhf libxtst6 libxtst6:armhf libbz2-dev libbz2-dev:armhf libsm6 libsm6:armhf

#installing libpng12 a is requirment for steam
mkdir ~/Downloads/libpng
cd ~/Downloads/libpng
wget http://launchpadlibrarian.net/377987065/libpng12-0_1.2.54-1ubuntu1.1_armhf.deb
wget http://launchpadlibrarian.net/377986999/libpng12-0_1.2.54-1ubuntu1.1_arm64.deb
sudo dpkg -i *.deb
cd ~
rm -r ~/Downloads/libpng

#Installing steam with ptitSeb script included with box86
chmod +x ~/box86/install_steam.sh
bash ~/box86/install_steam.sh

echo "Part 12 - Done"
