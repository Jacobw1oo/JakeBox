#!/data/data/com.termux/files/usr/bin/bash

#This is created by combing all the parts together, but part are likely to get updated and not this document
echo "STOP, do not run this"
read -p "Press CRTL + C to cancle"

#part 1
# Setup termux
echo "allow-external-apps = true" >> ~/.termux/termux.properties
echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties

pkg clean && termux-setup-storage && yes | pkg update &&
pkg install -y tsu nano wget pulseaudio && pkg clean || exit

echo 'alias jakebox-terminal="./terminal.sh"
alias jakebox="./start.sh"' > ~/.bashrc

# Setup environment variables
CHROOT="./ubuntu"
ROOTFS="https://cdimage.ubuntu.com/ubuntu-base/releases/24.04/release/ubuntu-base-24.04-base-arm64.tar.gz"
TMPDIR="/data/data/com.termux/files/usr/tmp"

sudo mkdir ${CHROOT}
sudo mkdir -p ${CHROOT}/sdcard
sudo mkdir -p ${CHROOT}/dev/shm
sudo chmod 1777 ${CHROOT}/dev/shm
sudo mkdir -p ${CHROOT}/tmp/.X11-unix
sudo chmod 755 ${CHROOT}/tmp/.X11-unix
sudo wget --directory-prefix ${CHROOT} ${ROOTFS}
sudo tar -xpf ${CHROOT}/*.tar.gz --directory ${CHROOT}
sudo rm ${CHROOT}/*.tar.gz

#wget --directory-prefix ${CHROOT} part2.sh
#end of part 1

#upgrading for 22 to 24
#echo"current version"
#lsb_release -a
#read -p "Press enter to attempt distro upgrade"
#do-release-upgrade -d
#echo"current version"
#lsb_release -a
#echo "it should be 24.04 noble"
#read -p "Press enter to continue"

#!/bin/sh
#start of part2
#designed to fix issue at root user level
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "127.0.0.1 localhost" > /etc/hosts
apt update

groupadd -g 3001 aid_bt
groupadd -g 3002 aid_bt_net
groupadd -g 3003 aid_inet
groupadd -g 3004 aid_net_raw
groupadd -g 3005 aid_admin

usermod -a -G 3003 root
usermod -a -G 3003 _apt
usermod -g 3003 _apt

#fixes user issue later
chmod 755 /
chmod 755 /bin
chmod 755 /lib

chmod 777 /tmp


#Mesa Update
apt-get install software-properties-common
add-apt-repository ppa:mastag/mesa-turnip-kgsl
dpkg --add-architecture armhf # enable installation of armhf libraries
apt update
apt upgrade

#end of part2


#echo "gdm3 is broken select lightdm (on 22)"
#read -p "Press enter to continue"

#start of part 3
#!/bin/sh
#installing xfce4 desktop (currenlty has known bug that break it)
apt install xubuntu-desktop

#installing KDE (Kubuntu) desktop
#apt install kubuntu-desktop
#Dont install suggested it 3 hour download (instead of 20 mins), it cost 10 extra Gb aswell.
#apt install kubuntu-desktop --install-suggests

#fixing terminal xfce4 terminal is for xfce4 and konsole is for KDE
apt install xfce4-terminal
#apt install konsole

# change terminal to xfce4 or konsole
update-alternatives --config x-terminal-emulator

#fixes clock - mine is for central time
ln -sf /usr/share/zoneinfo/US/Central /etc/localtime

#creating user
#adds needed groups
groupadd storage
groupadd wheel
#adding user named gamer
useradd -m -g users -G wheel,audio,video,storage -s /bin/bash gamer
#setting password for gamer, password is gamer
echo "setting password for user (gamer). My password is gamer"
read -p "Press enter to continue"
passwd gamer

#fixing sudo
apt install -y nano
echo "add /etc/sudoers"
echo "gamer ALL=(ALL:ALL) ALL"
echo "right below"
echo "root ALL=(ALL:ALL) ALL"
read -p "Press enter to continue"
nano /etc/sudoers

#login
su gamer
cd ~

#end of part3.sh

#!/bin/sh
#start of part4.sh

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
export BOX86_BASH=~/opt/box86_bash
export BOX64_BASH=~/opt/box64_bash
#need to add it to ~/.bashrc
echo "export XDG_RUNTIME_DIR=/tmp/xdg/" >> ~/.bashrc
echo "export BOX86_BASH=~/opt/box86_bash" >> ~/.bashrc
echo "export BOX64_BASH=~/opt/box64_bash" >> ~/.bashrc

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
#wget https://raw.githubusercontent.com/ptitSeb/box86/tests/bash -O /usr/local/bin/box86-bash
wget https://github.com/ptitSeb/box86/blob/c5bccdf300ff5017b7225e49a934c395c51f297b/tests/bash -O /usr/local/bin/box86-bash

#wget https://raw.githubusercontent.com/ptitSeb/box64/tests/bash -O /usr/local/bin/box64-bash
wget https://github.com/ptitSeb/box64/blob/c6e981a36369b560012f22f29b69e8e8843c072b/tests/bash -O /usr/local/bin/box64-bash

# use to fix not having binfmt, which we have working (WIP, need move box64_bash)
sudo chmod +x /usr/local/bin/box64-bash
sudo chmod +x /usr/local/bin/box64-bash
echo "export BOX86_BASH=/usr/local/bin/box64-bash
'export BOX64_BASH=/usr/local/bin/box64-bash" >> ~/.bashrc


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

sudo update-binfmts --import box86.conf
sudo update-binfmts --import box64.conf
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
#download updated local copy (was 0.5.17)
#sudo dpkg -i ./lutris_0.5.*_all.deb

#installing Rare
#incomplete

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
#flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#fixing appimages
#fixes mounting
sudo chmod a+rw /dev/fuse
#fixing binfmts for appimage

#later fixing for Graphics
sudo echo "MESA_LOADER_DRIVER_OVERRIDE=zink" >> /etc/environment
sudo echo "VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/freedreno_icd.aarch64.json:/usr/share/vulkan/icd.d/freedreno_icd.armv7l.json" >> /etc/environment
sudo echo "TU_DEBUG=noconform" >> /etc/environment

#end of part 4

#start part5

# can only be run after start xfce4
#Edit your ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml file and change: vblank_mode from auto to off.

#end of part5


#notes for extra on compiling mesa
#sudo apt-get install python3-pip
#sudo apt remove meson
#python3 -m pip install meson
#python3 -m pip install ninja
#had to change meson to ./meson-1.5.0/meson.py



