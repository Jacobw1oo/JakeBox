#!/bin/bash
#gl4es.sh
#Part 8 post - Debian user - compiling and installing gl4es
echo "Part 8 post - Debian user - compiling and installing gl4es"
set -e

#get dependances
apt install -y git gcc build-essential cmake libx11-dev

#git clone
cd $JAKESCRIPTS/packages/
git clone https://github.com/ptitSeb/gl4es
cd gl4es

#compiling and install
mkdir build; cd build; cmake -S ../../gl4es; make install

rm -r gl4es

cd $JAKESCRIPTS/packages/
