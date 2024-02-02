#!/bin/bash
#Part 6 - Debian User - Installing box86-box64 from debian repo
#bash box8664apt.sh

wget https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list && wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg
wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list && wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
sudo apt update
sudo apt install box86-android box64-android

#Grabing box86 and 64 github due to not having binfmt, we use box86/64 bash
git clone https://github.com/ptitSeb/box86 /home/gamer/
git clone https://github.com/ptitSeb/box64 /home/gamer/
# use to fix not having binfmt
"export BOX86_BASH=~/box86/tests/bash" >> ~/.bashrc
"export BOX64_BASH=~/box64/tests/bash" >> ~/.bashrc
