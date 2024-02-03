#!/bin/bash
#Part 6 - Debian User - Compiling and Installing box86-box64
#box8664compile.sh
set -e

sudo apt install gcc-arm-linux-gnueabihf make cmake git wget

# Box86 clone, compile, and install (-DRK3399=1 is for most AArch64)
git clone https://github.com/ptitSeb/box86 /home/gamer/box86
cd ~/box86; mkdir build; cd build; cmake ../ -DRK3399=1; make -j$(nproc); sudo make install

# Box64 clone, compile, and install (-DRK3399=1 is for most AArch64)
git clone https://github.com/ptitSeb/box64 /home/gamer/box64
cd ~/box64; mkdir build; cd build; cmake ../ -DRK3399=1; make -j$(nproc); sudo make install

cd ~/

# use to fix not having binfmt
sudo chmod +x ~/box86/tests/bash
sudo chmod +x ~/box64/tests/bash
echo "export BOX86_BASH=~/box86/tests/bash
'export BOX64_BASH=~/box64/tests/bash" >> ~/.bashrc
