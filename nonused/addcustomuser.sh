#!/bin/bash

#DEPRICATED, no longer used

#Part 4 - Debian - Adding Custom User (Disabled)
#addcustomuser.sh
# direct copy of cheadrian - Addons_Proot_Add_user.sh
# https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/blob/main/Scripts/Addons_Proot_Add_user.sh

export GREEN='\033[0;32m'
export UYELLOW='\033[4;33m'
export WHITE='\033[0;37m'

if id -u box >/dev/null 2>&1; then
    echo -e "${GREEN}Looks like the user 'box' exists."
    echo -e "${UYELLOW}Proot\nusername: box\npassword: box${WHITE}"
	read -n 1 -s -r -p "Press any key to continue."
	echo -e "${WHITE}"
	exit
fi

echo -e "${GREEN}This script will add a new user to the proot, named 'box'."
echo -e "${UYELLOW}New proot\nusername: box\npassword: box${WHITE}"
read -n 1 -s -r -p "Press any key to continue."
echo -e "${WHITE}"
echo -e "${GREEN}Create the box user, add to sudo.${WHITE}"
groupadd storage
groupadd wheel
groupadd video
useradd -U -m -G wheel,audio,video,storage -s /bin/bash box -p box

echo -e "${GREEN}Install 'sudo' and add box to sudoers.${WHITE}"
apt install -y sudo
echo "box  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

echo -e "${UYELLOW}Now you can use the 'box' user to run what you want: su box.${WHITE}"
read -n 1 -s -r -p "Press any key to continue."
echo -e "${WHITE}"
