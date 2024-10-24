#!/bin/bash

#DEPRICATED, no longer used

#heroiccompile.sh
#Part 13 - Debian User - compile and install heroic games launcher
echo "Part 13 - Debian User - Compiling and Installing Heroic Games Lanucher"
#HeroicGamesLauncher will remain a compile due to how often it updates and that epic games often breaks the pervious version.

#Installing Kate got alot of file editing to do
#sudo apt install -y kate

#Installing NodeJS, 
sudo apt install -y nodejs npm

#will need this before using yarn
export USE_SYSTEM_FPM=true 

#installing Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn

# Installing nvm dependencies
sudo apt install -y curl gnupg2
# Installing nvm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
#fixes
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
#install node js
nvm install node
nvm install 21.6.1
nvm use 21.6.1
# using nvm to install dependencies that were broken

#cheating on this step by doing a frist yarn on another computer
#Clone the repo 
#cd ~/Downloads
#git clone https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher.git --recurse-submodules
#cd HeroicGamesLauncher

#yarn 

#end of cheating
#then moving the updated directory

#getting build depencices ready
sudo apt install -y openjpeg-tools ruby-dev
sudo gem install ruby
sudo gem install fpm

#user need to update electron-builder.yml and change the mirror to this, version v27.0.0 are both on page 9 currently
#https://github.com/electron/electron/releases/download/v
#What is default
#https://github.com/castlabs/electron-releases/releases/download/v

#fixing host key error for yarn later
#mkdir -p ~/.ssh
#ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
#ssh-keygen -t rsa -C "user.email"
#cat ~/.ssh/id_rsa.pub
#id_rsa.pub key to SSH keys list on your GitHub profile

#install a arm 64 compable electron - DO NOT USE -
# npm install electron@27.3.2 --force

#install a arm 64 compable electron 
npm install electron@v27.0.0+wvcus --force

#getting yarn depencices ready
yarn --network-timeout 600000

#install a arm 64 compable electron - DO NOT USE -
# npm install electron@27.3.2 --force

#install a arm 64 compable electron 
npm install electron@27.0.0 --force

#for testing compile driectory 
#USE_SYSTEM_FPM=TRUE HEROIC_NO_REACT_DEVTOOLS=1 yarn start

#in packages.json for dist-linux have to add --arm64 to --linux

#compile heroic games launcher into deb for aarch64
USE_SYSTEM_FPM=TRUE yarn dist:linux # Optionally specify a package to create (eg: deb, pacman, tar.xz, rpm, AppImage); default: AppImage

#install heroic games launcher deb
cd dist/
sudo dpkg -i heroic2.12.0_arm64.deb
cd ~/


#fixing start issues
cd /opt/Heroic
sudo chown root chrome-sandbox
sudo chmod 4755 chrome-sandbox
sudo dbus-launch

#running heroic
dbus-run-session heroic --no-sandbox


echo "Part 13 - Done"

#updating all depencices - DO NOT USE - to be removed
#USE_SYSTEM_FPM=TRUE yarn upgrade-interactive --latest --network-timeout 600000

#for an arch system (aarch64)
#USE_SYSTEM_FPM=TRUE yarn dist:linux pacman
