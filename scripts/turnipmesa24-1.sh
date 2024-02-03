#!/bin/bash
#Part 5 - Debian User - Installing turnip v4 GPU drivers
#turnipv4.sh
set -e

#making packages directory
mkdir /usr/local/bin/jakebox/packages

#Downloading turnip zink drivers
curl -s -o /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_24.1.0-devel-20240202_arm64.deb https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/packages/mesa-vulkan-kgsl_24.1.0-devel-20240202_arm64.deb
curl -s -o /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_24.1.0-devel-20240202_arm32.deb https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/packages/mesa-vulkan-kgsl_24.1.0-devel-20240202_arm32.deb

#Instilling Drivers
sudo dpkg -i /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_24.1.0-devel-20240202_arm*

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
