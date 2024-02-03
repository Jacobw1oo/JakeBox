#!/bin/bash
#turnipmesa23-3.sh
#Part 7 - Debian User - Installing mesa 23.3 turnip zink GPU drivers
echo "Part 7 - Debian User - Installing mesa 23.3 turnip zink GPU drivers"
set -e

#Downloading turnip zink drivers
curl -s -o /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_23.3.0-devel-20230812_arm64.deb https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/packages/mesa-vulkan-kgsl_23.3.0-devel-20230812_arm64.deb
curl -s -o /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_23.3.0-devel-20230812_armhf.deb https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/packages/mesa-vulkan-kgsl_23.3.0-devel-20230812_armhf.deb 

#Instilling Drivers
sudo dpkg -i /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_23.3.0-devel-20230812_arm64.deb
sudo dpkg -i /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_23.3.0-devel-20230812_armhf.deb 

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

echo "Part 7 - Done"
