#!/bin/bash
#Part 9 - Debian User - installing steam
#steaminstall.sh

apt install -y binutils xterm file zenity pciutils libcairo2 libcairo2:armhf libxdamage1 libxdamage1:armhf libjpeg-dev libjpeg-dev:armhf libselinux1 libselinux1:armhf libgl1-mesa-glx libgl1-mesa-glx:armhf libogg-dev libogg-dev:armhf libvorbis-dev libvorbis-dev:armhf libice6 libice6:armhf libxss1 libxss1:armhf libxtst6 libxtst6:armhf libbz2-dev libbz2-dev:armhf libsm6 libsm6:armhf

echo -e "${GREEN}Install libpng12.${WHITE}"
mkdir ~/Downloads/libpng
cd ~/Downloads/libpng
wget http://launchpadlibrarian.net/377987065/libpng12-0_1.2.54-1ubuntu1.1_armhf.deb
wget http://launchpadlibrarian.net/377986999/libpng12-0_1.2.54-1ubuntu1.1_arm64.deb
dpkg -i *.deb
cd ~
rm -r ~/Downloads/libpng

echo -e "${GREEN}Install steam using the Box86 script, in 'box' user.${WHITE}"

sudo -H -i -u box bash << EOF
wget https://raw.githubusercontent.com/ptitSeb/box86/master/install_steam.sh
chmod +x install_steam.sh
./install_steam.sh
EOF

source ~/.bashrc
echo -e "${GREEN}Run Steam through bash86, using 'box' user.${WHITE}"
sudo -E -H -u box box86 steam
