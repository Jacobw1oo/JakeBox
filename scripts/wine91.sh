#!/bin/bash
#wine91.sh
#Part 10 - Debian User - Install the frist Wine
echo "Part 10 - Debian User - Install the frist Wine"
#https://github.com/Kron4ek/Wine-Builds/releases/
set -e

WINE_AMD64=https://github.com/Kron4ek/Wine-Builds/releases/download/9.1/wine-9.1-amd64.tar.xz
WINE_DIR=~/wine

# Download wine
rm -rf ${WINE_DIR}
wget --quiet --show-progress --continue --directory-prefix ${WINE_DIR} ${WINE_AMD64}
tar -xf ${WINE_DIR}/*.tar.xz --directory ${WINE_DIR}
mv ${WINE_DIR}/wine*/* ${WINE_DIR}
rm -rf ${WINE_DIR}/wine*

# Install symlinks
sudo rm -f /usr/local/bin/wine /usr/local/bin/wine64
sudo ln -s ${WINE_DIR}/bin/wine /usr/local/bin/wine
sudo ln -s ${WINE_DIR}/bin/wine64 /usr/local/bin/wine64
sudo chmod +x /usr/local/bin/wine /usr/local/bin/wine64

# Setting up wine with GPU acceleration

echo '#!/bin/bash
DISPLAY=:1 WINE_DEBUG=-all MESA_NO_ERROR=1 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_EXTENSION_OVERRIDE="GL_EXT_polygon_offset_clamp" \
exec taskset -c 4-7 box86 wine "$@"
' > /usr/local/bin/virgl

echo '#!/bin/bash
DISPLAY=:1 WINE_DEBUG=-all MESA_NO_ERROR=1 TU_DEBUG=noconform MESA_VK_WSI_DEBUG=sw MESA_LOADER_DRIVER_OVERRIDE=zink \
exec taskset -c 4-7 box86 wine "$@"
' > /usr/local/bin/zink

echo '#!/bin/bash
DISPLAY=:1 WINE_DEBUG=-all MESA_NO_ERROR=1 TU_DEBUG=noconform MESA_VK_WSI_DEBUG=sw \
exec taskset -c 4-7 box86 wine "$@"
' > /usr/local/bin/vulkan

sudo chmod +x /usr/local/bin/vulkan /usr/local/bin/zink /usr/local/bin/virgl

echo "Part 10 - Done"
