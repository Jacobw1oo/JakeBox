#!/bin/bash
#turnipmesa23-3-1.sh
#Part 7 - Debian User - Installing mesa 23.3 turnip zink GPU drivers - it a bit older than the other but confirmed to work
echo "Part 7 - Debian User - Installing mesa 23.3 turnip zink GPU drivers"
set -e

#dependices install for mesa-vulkan-kgsl_*_armhf
sudo apt install -y libvulkan1:armhf 

#Downloading turnip zink drivers
cd /usr/local/bin/jakebox/packages/
wget https://github.com/xDoge26/proot-setup/raw/main/Packages/mesa-vulkan-kgsl_23.3.0-devel-20230803_arm64.deb
wget https://github.com/xDoge26/proot-setup/raw/main/Packages/mesa-vulkan-kgsl_23.3.0-devel-20230803_armhf.deb

#Instilling Drivers
sudo dpkg -i /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_23.3.0-devel-20230803_arm64.deb
sudo dpkg -i /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_23.3.0-devel-20230803_armhf.deb 

#Tools for testing driver
sudo apt install -y vulkan-tools mesa-utils glmark2-x11

echo '[Desktop Entry]
Name=VKCube Turnip
Exec=bash -c "env TU_DEBUG=noconform MESA_VK_WSI_DEBUG=sw vkcube"
Icon=vkcube
Terminal=true
Type=Application' > ~/Desktop/VKCube_turnip.desktop
chmod +x ~/Desktop/VKCube_turnip.desktop

echo '[Desktop Entry]
Name=GLX Gears Turnip
Exec=bash -c "env MESA_LOADER_DRIVER_OVERRIDE=zink TU_DEBUG=noconform glxgears"
Icon=glxgears
Terminal=true
Type=Application' > ~/Desktop/GLXGears_turnip.desktop
chmod +x ~/Desktop/GLXGears_turnip.desktop

cd ~/
echo "Part 7 - Done"
sleep 10
