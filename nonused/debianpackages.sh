#!/bin/bash

#DEPRICATED, no longer used

#debianpackages.sh
#Part 6 - Debian User - Installing lots of packages
echo "Part 6 - Debian User - Installing lots of packages"

# If amy command fails, script is stoped
set -e

# Install related kits
sudo dpkg --add-architecture armhf
sudo apt update
sudo apt upgrade -y
sudo apt install -y gpg xz-utils # software-properties-common
sudo apt install make cmake git wget vulkan-tools mesa-utils g++-arm-linux-gnueabihf g++-aarch64-linux-gnu -y

# - These packages are needed for running box86/wine-i386 box64/wine-amd64
sudo apt install -y libgl1:armhf libasound2:armhf libc6:armhf libglib2.0-0:armhf libgphoto2-6:armhf libgphoto2-port12:armhf libgstreamer-plugins-base1.0-0:armhf libgstreamer1.0-0:armhf libpcap0.8:armhf libpulse0:armhf libsane1:armhf libudev1:armhf libunwind8:armhf libusb-1.0-0:armhf libx11-6:armhf libxext6:armhf ocl-icd-libopencl1:armhf libopencl1:armhf ocl-icd-libopencl1:armhf libopencl-1.2-1:armhf libasound2-plugins:armhf libncurses6:armhf libcapi20-3:armhf libcups2:armhf libdbus-1-3:armhf libfontconfig1:armhf libfreetype6:armhf libglu1-mesa:armhf libglu1:armhf libgnutls30:armhf libgsm1:armhf libgssapi-krb5-2:armhf libkrb5-3:armhf libodbc1:armhf libosmesa6:armhf libpng16-16:armhf libsdl2-2.0-0:armhf libv4l-0:armhf libxcomposite1:armhf libxcursor1:armhf libxfixes3:armhf libxi6:armhf libxinerama1:armhf libxrandr2:armhf libxrender1:armhf libxslt1.1:armhf libxxf86vm1:armhf

sudo apt install -y libgl1:arm64 libasound2:arm64 libc6:arm64 libglib2.0-0:arm64 libgphoto2-6:arm64 libgphoto2-port12:arm64 libgstreamer-plugins-base1.0-0:arm64 libgstreamer1.0-0:arm64 libpcap0.8:arm64 libpulse0:arm64 libsane1:arm64 libudev1:arm64 libunwind8:arm64 libusb-1.0-0:arm64 libx11-6:arm64 libxext6:arm64 ocl-icd-libopencl1:arm64 libopencl1:arm64 ocl-icd-libopencl1:arm64 libopencl-1.2-1:arm64 libasound2-plugins:arm64 libncurses6:arm64 libcapi20-3:arm64 libcups2:arm64 libdbus-1-3:arm64 libfontconfig1:arm64 libfreetype6:arm64 libglu1-mesa:arm64 libglu1:arm64 libgnutls30:arm64 libgsm1:arm64 libgssapi-krb5-2:arm64 libkrb5-3:arm64 libodbc1:arm64 libosmesa6:arm64 libpng16-16:arm64 libsdl2-2.0-0:arm64 libv4l-0:arm64 libxcomposite1:arm64 libxcursor1:arm64 libxfixes3:arm64 libxi6:arm64 libxinerama1:arm64 libxrandr2:arm64 libxrender1:arm64 libxslt1.1:arm64 libxxf86vm1:arm64

# Clean
sudo apt clean
sudo apt autoremove -y

echo "Part 6 - Done"
