#!/bin/bash
#Part 5 - Debian User - compiling and installing turnip GPU drivers
#turnipcompile.sh

#some fun file links
#https://gitlab.freedesktop.org/mesa/mesa
#https://gitlab.freedesktop.org/Danil/mesa/-/archive/turnip/feature/a7xx-basic-support/mesa-turnip-feature-a7xx-basic-support.tar.gz
#https://gitlab.freedesktop.org/Danil/mesa/-/tree/feature/turnip/a750

set -e

#Making sure architecture is correct
sudo dpkg --add-architecture armhf
sudo apt update
sudo apt upgrade -y

#getting build-dependencies for Mesa source package
sudo echo "deb-src [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://deb.debian.org/debian bookworm main contrib" >> /etc/apt/sources.list
sudo echo "deb-src [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://deb.debian.org/debian bookworm-updates main contrib" >> /etc/apt/sources.list
sudo apt update
sudo apt-get build-dep mesa
sudo apt install wget unzip
sudo apt install make cmake git wget vulkan-tools mesa-utils g++-arm-linux-gnueabihf g++-aarch64-linux-gnu
cp /usr/include/libdrm/drm.h /usr/include/libdrm/drm_mode.h /usr/include/

# main mesa repo
git clone https://gitlab.freedesktop.org/mesa/mesa /home/gamer/Downloads/mesa
cd /home/gamer/Downloads/

BUILD_PREFIX=/home/gamer/Downloads/
MESA_PREFIX=${BUILD_PREFIX}/mesa
#MESA_PREFIX=${BUILD_PREFIX}/mesa-turnip-feature-a7xx-basic-support

MESA_VER=$(cat ${MESA_PREFIX}/VERSION)
DATE=$(date +"%F" | sed 's/-//g')
MESA_64=${BUILD_PREFIX}/mesa-vulkan-kgsl_${MESA_VER}-${DATE}_arm64
MESA_32=${BUILD_PREFIX}/mesa-vulkan-kgsl_${MESA_VER}-${DATE}_arm32

#applying patch
cd ${MESA_PREFIX}/src/
wget https://raw.githubusercontent.com/Jacobw1oo/JakBox/main/packages/dri.zip
unzip ${MESA_PREFIX}/src/dri.zip
git apply -v wsi-termux-x11-v3.patch

#Building arm64 binary
# all arm64 requirments
sudo apt install zlib1g-dev:arm64 libexpat1-dev:arm64 libdrm-dev:arm64 libx11-dev:arm64 libx11-xcb-dev:arm64 libxext-dev:arm64 libxdamage-dev:arm64 libxcb-glx0-dev:arm64 libxcb-dri2-0-dev:arm64 libxcb-dri3-dev:arm64 libxcb-shm0-dev:arm64 libxcb-present-dev:arm64 libxshmfence-dev:arm64 libxxf32vm-dev:arm64 libxrandr-dev:arm64 libwayland-dev:arm64 wayland-protocols:arm64 libwayland-egl-backend-dev:arm64 -Y

cd ${MESA_PREFIX}
mkdir build64

# file to handle host build config, we have two due to cross compile for arm32 (armhf)
echo "[binaries]
c = 'arm-linux-gnueabihf-gcc'
cpp = 'arm-linux-gnueabihf-g++'
ar = 'arm-linux-gnueabihf-ar'
strip = 'arm-linux-gnueabihf-strip'
pkgconfig = 'arm-linux-gnueabihf-pkg-config'

[host_machine]
system = 'linux'
cpu_family = 'arm'
cpu = 'aarch64'
endian = 'little'
" > ${MESA_PREFIX}/arm64.txt

sudo meson build64/ --prefix /usr --libdir lib/aarch64-linux-gnu/ -D platforms=x11,wayland -D gallium-drivers=freedreno -D vulkan-drivers=freedreno -D freedreno-kmds=msm,kgsl -D dri3=enabled -D buildtype=release -D glx=disabled -D egl=disabled -D gles1=disabled -D gles2=disabled -D gallium-xa=disabled -D opengl=false -D shared-glapi=false -D b_lto=true -D b_ndebug=true -D cpp_rtti=false -D gbm=disabled -D llvm=disabled -D shared-llvm=disabled -D xmlconfig=disabled
sudo meson compile -C build64/
sudo meson install -C build64/ --destdir ${MESA_64}

#building arm64 deb
cd ${BUILD_PREFIX}

sudo apt remove -y mesa-vulkan-drivers:arm64
sudo apt download mesa-vulkan-drivers:arm64
sudo dpkg-deb -e mesa-vulkan-drivers_*_arm64.deb ${MESA_64}/DEBIAN/
sudo sed -ie "3s/.*/Version: ${MESA_VER}-${DATE}/g" ${MESA_64}/DEBIAN/control
sudo rm mesa-vulkan-drivers_*_arm64.deb
sudo rm ${MESA_64}/DEBIAN/md5sums ${MESA_64}/DEBIAN/triggers
sudo rm -rf ${MESA_64}/usr/share/drirc.d
sudo dpkg-deb --build --root-owner-group ${MESA_64}

#Building arm32 binary
# all armhf requirments
sudo apt install zlib1g-dev:armhf libexpat1-dev:armhf libdrm-dev:armhf libx11-dev:armhf libx11-xcb-dev:armhf libxext-dev:armhf libxdamage-dev:armhf libxcb-glx0-dev:armhf libxcb-dri2-0-dev:armhf libxcb-dri3-dev:armhf libxcb-shm0-dev:armhf libxcb-present-dev:armhf libxshmfence-dev:armhf libxrandr-dev:armhf libwayland-dev:armhf wayland-protocols:armhf libwayland-egl-backend-dev:armhf -Y

# pkgconfig will not work unless it's arch matches
sudo apt remove pkg-config
sudo apt install pkg-config:armhf

cd ${MESA_PREFIX}
mkdir build32

echo "[binaries]
c = 'arm-linux-gnueabihf-gcc'
cpp = 'arm-linux-gnueabihf-g++'
ar = 'arm-linux-gnueabihf-ar'
strip = 'arm-linux-gnueabihf-strip'
pkgconfig = 'arm-linux-gnueabihf-pkg-config'

[host_machine]
system = 'linux'
cpu_family = 'arm'
cpu = 'armv7l'
endian = 'little'
" > ${MESA_PREFIX}/arm32.txt

sudo meson build32/ --cross-file arm32.txt --prefix /usr --libdir lib/aarch64-linux-gnu/ -D platforms=x11,wayland -D gallium-drivers=freedreno -D vulkan-drivers=freedreno -D freedreno-kmds=msm,kgsl -D dri3=enabled -D buildtype=release -D glx=disabled -D egl=disabled -D gles1=disabled -D gles2=disabled -D gallium-xa=disabled -D opengl=false -D shared-glapi=false -D b_lto=true -D b_ndebug=true -D cpp_rtti=false -D gbm=disabled -D llvm=disabled -D shared-llvm=disabled -D xmlconfig=disabled
sudo meson compile -C build32/
sudo meson install -C build32/ --destdir ${MESA_32}


#building arm32 deb
cd ${BUILD_PREFIX}

sudo apt remove -y mesa-vulkan-drivers:armhf
sudo apt download mesa-vulkan-drivers:armhf
sudo dpkg-deb -e mesa-vulkan-drivers_*_armhf.deb ${MESA_32}/DEBIAN/
sudo sed -ie "3s/.*/Version: ${MESA_VER}-${DATE}/g" ${MESA_32}/DEBIAN/control
sudo rm mesa-vulkan-drivers_*_armhf.deb
sudo rm ${MESA_32}/DEBIAN/md5sums ${MESA_32}/DEBIAN/triggers
sudo rm -rf ${MESA_32}/usr/share/drirc.d
sudo dpkg-deb --build --root-owner-group ${MESA_32}


sudo apt remove pkg-config
sudo apt install pkg-config:arm64


#If i had to build mesa for the a750
#git clone https://gitlab.freedesktop.org/Danil/mesa/-/tree/feature/turnip/a750 /home/gamer
