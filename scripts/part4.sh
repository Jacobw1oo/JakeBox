#!/bin/sh

cd ~

#fixing keyboard
sudo apt install locales
sudo locale-gen en_US.UTF-8

#destorying snap
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt-get update
sudo apt-get install -y firefox-esr

sudo apt-get autopurge snapd

cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
# To prevent repository packages from triggering the installation of Snap,
# this file forbids snapd from being installed by APT.
# For more information: https://linuxmint-user-guide.readthedocs.io/en/latest/snap.html
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

#checking binfmt support
sudo apt-get install -y binfmt-support
# just add this one, idk
sudo apt-get install -y wine-binfmt

#fixing XDG and box bash
mkdir /tmp/xdg
export XDG_RUNTIME_DIR="/tmp/xdg/"
#need to add it to ~/.bashrc
echo "export XDG_RUNTIME_DIR=/tmp/xdg/" >> ~/.bashrc


#update sources (it been change in 24, have to fix later)
#sudo echo "
#deb http://archive.ubuntu.com/ubuntu/ noble main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu/ noble  main restricted universe multiverse
#
#deb http://archive.ubuntu.com/ubuntu/ noble-updates main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu/ noble -updates main restricted universe multiverse
#
#deb http://archive.ubuntu.com/ubuntu/ noble-security main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu/ noble-security main restricted universe multiverse
#
#deb http://archive.ubuntu.com/ubuntu/ noble-backports main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu/ noble-backports main restricted universe multiverse
#
#deb http://archive.canonical.com/ubuntu noble partner
#deb-src http://archive.canonical.com/ubuntu noble partner
#" >>  /etc/apt/sources.list
#sudo apt update

#change root passwd
#setting password for root, password is toor
echo "setting password for root. My password is toor"
read -p "Press enter to continue"
sudo passwd toor

#installing box86/box64
sudo wget https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list && wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg
sudo wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list && wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
sudo apt update
sudo apt install box86-android box64-android

#Grabing box86 and 64 github due to not having binfmt, we use box86/64 bash
#sudo wget https://raw.githubusercontent.com/ptitSeb/box86/tests/bash -O /usr/local/bin/box86-bash
sudo wget https://github.com/ptitSeb/box86/blob/c5bccdf300ff5017b7225e49a934c395c51f297b/tests/bash -O /usr/local/bin/box86_bash

#sudo wget https://raw.githubusercontent.com/ptitSeb/box64/tests/bash -O /usr/local/bin/box64-bash
sudo wget https://github.com/ptitSeb/box64/blob/c6e981a36369b560012f22f29b69e8e8843c072b/tests/bash -O /usr/local/bin/box64_bash

# use to fix not having binfmt, which we have working (WIP, need move box64_bash)
sudo chmod +x /usr/local/bin/box64_bash
sudo chmod +x /usr/local/bin/box64_bash
echo "export BOX86_BASH=/usr/local/bin/box64_bash
export BOX64_BASH=/usr/local/bin/box64_bash" >> ~/.bashrc

#making sure the display and audio are set
echo "export DISPLAY=:0" >> ~/.bashrc
echo "export PULSE_SERVER=127.0.0.1 " >> ~/.bashrc

#fixing binfmt
sudo mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
sudo echo "none  /proc/sys/fs/binfmt_misc binfmt_misc defaults 0 0" >> /etc/fstab

sudo echo "
package box86
interpreter /usr/local/bin/box86
magic \x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00
mask \xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff
" >  /usr/share/binfmts/box86.conf

sudo echo "
package box64
interpreter /usr/local/bin/box64
magic \x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x3e\x00
mask \xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff
" >  /usr/share/binfmts/box64.conf

sudo echo "
package box64
interpreter /usr/local/bin/box64
extension AppImage
" >  /usr/share/binfmts/box64_appimage.conf

sudo update-binfmts --import box86.conf
sudo update-binfmts --import box64.conf
sudo update-binfmts --import box64_appimage.conf
sudo update-binfmts --enable
sudo update-binfmts --display

#testing binfmt (not needed)
#sudo apt install hello:i386 -y
#sudo apt remove hello:i386 -y
#sudo apt install hello:amd64 -y
#sudo apt remove hello:amd64 -y

#install Lutris
sudo apt-get install lutris -y
sudo apt-get install gamemode
#download updated local copy (currently 0.5.17)
#sudo dpkg -i ./lutris_0.5.*_all.deb

# extra fixes for Lutris

#line for fixing esync (eh, it a rough fix)
sudo echo "DefaultLimitNOFILE=524288" >> /etc/systemd/system.conf
sudo echo "DefaultLimitNOFILE=524288" >> /etc/systemd/user.conf
sudo echo "gamer hard nofile 524288" >> /etc/security/limits.conf
ulimit -Hn

#installing steam from ptitseb (work in progress)
#curl https://github.com/ptitSeb/box86/blob/master/install_steam.sh

#have to remove mesa update
#echo "have to remove below"
#echo " if dpkg-query -W libgl1-mesa-dri 2>/dev/null; then
#  echo Detected mesa driver for 64 bit ARM. Installing complementary 32 bit one
#  sudo apt install libgl1-mesa-dri:armhf
# fi "

#bash install_steam.sh

#installing flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
#after restart
#sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo chmod 4755 /usr/bin/bwrap

# this was add to mount to fix bwrap failed to make / slave: invalid argument
# already done
# sudo mount --bind $ROOTFSPATH $ROOTFSPATH

#fixing appimages
#fixes mounting (moved into root bashrc) as it not presestant
sudo chmod a+rw /dev/fuse
#fixing binfmts for appimage, (should already be done)
#/usr/share/binfmts/box64_appimage.conf

#running Heroic Appimage
#it is electron based so the /dev/shm has to be working
#there is like attempts 3 to fxies for /dev/shm, it should work
sudo apt-get install notify-osd
#Heroic needs dbus to be running
#sudo /etc/init.d/dbus start

#running Rare Appimage

#installing deps for assault cube
sudo apt-get install libsdl1.2-compat libsdl-image1.2 -y

#installing toontown
cd ~/Downloads
wget https://cdn.toontownrewritten.com/launcher/linux/launcher.flatpakref
#Installing flatpak for amd64 not (AArch64)
sudo flatpak --arch=x86_64 install launcher.flatpakref

#fixing controllers
#have to install input bridge
#tester (does not work)
#sudo apt-get install jstest-gtk
#sudo apt-get install xboxdrv

#fixing pulseaudio
sudo nano /etc/pulse/client.conf
# i changed shm to no

#Fixing controllers
  sudo apt-get install xserver-xorg-input-joystick joystick antimicro

  sudo groupadd -g 1004 input
  sudo usermod -a -G input root
  sudo usermod -a -G input gamer

  #opps, just going to sneak this one in
  sudo usermod -a -G aid_inet gamer

  # does not  work just used. getfacl /dev/input/event* to find group id and then made input group match it.

  sudo echo 'KERNEL=="event*", GROUP=="input", OWNER="gamer"' > /lib/udev/rules.d/99-input.rules
  #one of these or neither
  #sudo echo 'KERNEL=="event*", Name="input/%k", MODE="660", GROUP=="input" OWNER="gamer"' > /lib/udev/rules.d/99-input.rules

  #was
  #sudo echo 'KERNEL=="event*", Name="input/%k", MODE="660", GROUP=="input", OWNER="gamer"' > /lib/udev/rules.d/99-input.rules

  #sudo echo 'KERNEL=="event*", Name="input/%k", MODE="660", GROUP="input"' > /lib/udev/rules.d/99-input.rules
  #sudo echo 'KERNEL=="event*", SUBSYSTEM=="input", MODE="660", GROUP="input", OWNER="gamer", RUN+="sudo chmod 7S55 /dev/input/event11"' > /lib/udev/rules.d/99-input.rules

  #tmp fix
  #sudo chmod 755 /dev/input/event11
  #testing
  #sudo evtest
  #ls -al /dev/input/
  #getfacl /dev/input/event*

# Adding new / more wine
#cd ~/.local/share/lutris/runners/wine/
#wget wine-9-4.whatever
#tar -help

  #start part6

#later fixing for Graphics
sudo echo "MESA_LOADER_DRIVER_OVERRIDE=zink" >> /etc/environment
sudo echo "VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/freedreno_icd.aarch64.json:/usr/share/vulkan/icd.d/freedreno_icd.armv7l.json" >> /etc/environment
sudo echo "TU_DEBUG=noconform" >> /etc/environment

#crap i always all have to manually fix
  #update-binfmts --display
  #passwd root
  #cat /etc/environment
  #ulimit -Hn
  #99-input.rules

  #can only be run after start xfce4
  #Edit your ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml file and change: vblank_mode from auto to off.
