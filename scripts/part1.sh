#!/data/data/com.termux/files/usr/bin/bash
set +o histexpand

#have to chmod +x part1.sh and chmod 755 part1.sh

# Setup termux
echo "allow-external-apps = true" >> ~/.termux/termux.properties
echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties

pkg clean && termux-setup-storage && yes | pkg update &&
pkg install -y tsu nano wget pulseaudio && pkg clean || exit

#install x11 interface
pkg install x11-repo
pkg install termux-x11-nightly

echo 'alias jakeboxsys="./startterminal.sh"
alias jakebox="./start.sh"' >> ~/.bashrc

#echo 'pulseaudio --verbose --start --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"'>> ~/.bashrc

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

