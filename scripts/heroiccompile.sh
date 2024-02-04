#!/bin/bash
#heroiccompile.sh
#Part 13 - Debian User - compile and install heroic games launcher
echo "Part 13 - Debian User - Compiling and Installing Heroic Games Lanucher"
#HeroicGamesLauncher will remain a compile due to how often it updates and that epic games often breaks the pervious version.

#Installing NodeJS, 
sudo apt install -y nodejs npm

#installing Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn

#Clone the repo 
cd ~/Downloads
git clone https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git --recurse-submodules
cd HeroicGamesLauncher

#getting build depencices
cd ~/.cache/yarn/v6/
wget https://registry.yarnpkg.com/@mui/icons-material/-/icons-material-5.11.11.tgz
cd ~/Downloads/HeroicGamesLauncher
yarn

#compile heroic games launcher into deb for aarch64
#yarn dist:linux # Optionally specify a package to create (eg: deb, pacman, tar.xz, rpm, AppImage); default: AppImage

#for an arch system (aarch64)
#USE_SYSTEM_FPM=TRUE yarn dist:linux pacman

#compile for debian system
yarn dist:linux deb

#install heroic games launcher deb
#sudo dpkg -i something
cd ~/

echo "Part 13 - Done"
