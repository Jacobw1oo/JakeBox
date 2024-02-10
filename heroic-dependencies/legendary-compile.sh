#!/bin/bash
#legendary-compile.sh
#Debian Proot - compiling legendary
#https://github.com/derrod/legendary
#free and open-source Epic Games Launcher alternative
echo "Debian Proot - compiling legendary"

sudo apt install python3 python3-requests python3-setuptools-git
git clone https://github.com/derrod/legendary.git
cd legendary
pip install .
echo 'export PATH=$PATH:~/.local/bin' >> ~/.profile && source ~/.profile
