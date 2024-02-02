#!/bin/bash
#Part 5 - Debian User - compiling and installing turnip GPU drivers
#turnipcompile.sh

#some fun file links
#https://gitlab.freedesktop.org/Danil/mesa/-/archive/turnip/feature/a7xx-basic-support/mesa-turnip-feature-a7xx-basic-support.tar.gz
#https://gitlab.freedesktop.org/Danil/mesa/-/tree/feature/turnip/a750

set -e

#Going to try to build the turnip a750 for the 740
git clone https://gitlab.freedesktop.org/Danil/mesa/-/tree/feature/turnip/a750 /home/gamer

mkdir build
cd build
meson ..
sudo ninja install
