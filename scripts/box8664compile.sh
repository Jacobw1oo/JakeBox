#!/bin/bash
#Part 5 - Debian User - Compiling and Installing box86-box64
#bash box8664compile.sh
set -e


#Grabing box86 and 64 github due to not having binfmt, we use box86/64 bash
git clone https://github.com/ptitSeb/box86 /home/gamer/
git clone https://github.com/ptitSeb/box64 /home/gamer/
# use to fix not having binfmt
"export BOX86_BASH=~/box86/tests/bash" >> ~/.bashrc
"export BOX64_BASH=~/box64/tests/bash" >> ~/.bashrc
