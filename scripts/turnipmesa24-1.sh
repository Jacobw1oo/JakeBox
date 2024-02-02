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
sudo dkpg -i /usr/local/bin/jakebox/packages/mesa-vulkan-kgsl_24.1.0-devel-20240202_arm*
