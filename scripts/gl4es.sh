#!/bin/bash

#DEPRICATED, no longer used

#gl4es.sh
#Part 8 post - Debian user - compiling and installing gl4es
echo "Part 8 post - Debian user - compiling and installing gl4es"

# If amy command fails, script is stoped
set -e

#get dependances
sudo apt install -y git gcc build-essential cmake libx11-dev

#git clone
cd $JAKESCRIPTS/packages/
git clone https://github.com/ptitSeb/gl4es
cd gl4es

#compiling and install
mkdir build; cd build; cmake -S ../../gl4es; sudo make install

rm -r gl4es

cd $JAKESCRIPTS/packages/

echo "Part 8 - Done"
