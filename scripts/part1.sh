#!/data/data/com.termux/files/usr/bin/bash
set +o histexpand

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

