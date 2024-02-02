#!/bin/bash
#Part 6 - Debian User - Compiling and Installing box86-box64 for snapdragon
#box8664snapdragon.sh

#This script is for Snapdragon devices only.
#https://github.com/ptitSeb/box86/blob/master/docs/COMPILE.md
set -e

#Installing build requiremnts
sudo apt install gcc-arm-linux-gnueabihf make cmake git wget -y

# Box86 clone, compile, and install (-DSD888=1 is for latest Snapdragon processor alt: -DSD845=1)
git clone https://github.com/ptitSeb/box86 /home/gamer/
cd ~/box86; mkdir build; cd build; cmake ../ -DSD888=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo; make -j$(nproc); sudo make install

# Box64 clone, compile, and install (-DSD888=1 is for latest Snapdragon processor alt: -DSD845=1)
git clone https://github.com/ptitSeb/box64 /home/gamer/
cd ~/box64; mkdir build; cd build; cmake ../ -DSD888=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo; make -j$(nproc); sudo make install

cd ~/

# use to fix not having binfmt
"export BOX86_BASH=~/box86/tests/bash" >> ~/.bashrc
"export BOX64_BASH=~/box64/tests/bash" >> ~/.bashrc

