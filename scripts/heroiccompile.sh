#!/bin/bash
#Part 9 - Debian User - compile and install heroic games launcher
#heroiccompile.sh

#HeroicGamesLauncher will remain a compile due to how often it updates and that epic games often breaks the pervious version.


#Make sure Git, NodeJS, and Yarn are installed

#Clone the repo 
git clone https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git --recurse-submodules
cd HeroicGamesLauncher

#compile heroic games launcher into deb for aarch64
#yarn dist:linux # Optionally specify a package to create (eg: deb, pacman, tar.xz, rpm, AppImage); default: AppImage

#for an arch system (aarch64)
#USE_SYSTEM_FPM=TRUE yarn dist:linux pacman

#uing for debian system
yarn dist:linux deb


#install heroic games launcher deb
