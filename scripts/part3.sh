#!/bin/sh

#installing xfce4 desktop 
apt install xubuntu-desktop
#apt install xfce4

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
#adding user to input group
usermod -a -G input gamer
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

#stuff that need to be run at root boot
echo "update-binfmts --enable" >> ~/.bashrc
echo "chmod a+rw /dev/fuse" >> ~/.bashrc

#making sure the audio is loaded
echo "export PULSE_SERVER=127.0.0.1 " >> ~/.bashrc

#trying to fix render
#export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0

#installing python 3 and pip
apt-get install -y python3-pip
python3 -m pip install meson
python3 -m pip install ninja
apt-get install -y python3-apport python3-apt python3-aptdaemon python3-aptdaemon.gtk3widgets python3-cairo python3-cffi python3-cffi-backend python3-cryptography python3-cssselect python3-cups python3-cupshelpers python3-dbus python3-dev python3-distupgrade python3-evdev python3-gi python3-gi-cairo python3-ibus-1.0 python3-jinja2 python3-jsonschema python3-launchpadlib python3-lazr.restfulclient python3-lxml python3-mako python3-markupsafe python3-minimal python3-netifaces python3-netplan python3-oauthlib python3-protobuf python3-psutil python3-pyrsistent python3-setproctitle python3-software-properties python3-systemd python3-uno python3-update-manager python3-xcffib

#apt remove python3-pil
#python3 -m pip install --break-system-packages pillow

#apt remove python-gi-dev
#python3 -m pip install --break-system-packages PyGObject
#apt remove python3-yaml
#python3 -m pip install --break-system-packages PyYAML


# added a easy startx launcher
#export DISPLAY=:0

#remove due to causing break (i dont think this is correct)
#sudo /etc/init.d/dbus start
#alt taskset -c 4-7 startplasma-x11

echo "#!/bin/bash
sudo /etc/init.d/dbus start
export DISPLAY=:0
taskset -c 4-7 startxfce4
" >  /home/gamer/jakestartx.sh
chmod 755 /home/gamer/jakestartx.sh
chmod +x /home/gamer/jakestartx.sh

# expanding system to install a bunch of small things (mostly man docs)
#unminimize

# debuging segment faults
# gdb xfce4-notifyd-config
# run

#fxing shm again
cd /dev/
mkdir shm
chmod 777 shm

#login
su gamer -c cd ~

#end of part3.sh
