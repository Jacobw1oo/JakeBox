#Part 4 - Debian - Adding User

#!/bin/bash
#Username: gamer Password: gamer
set -e

# Not sure what these do
groupadd storage
groupadd wheel
groupadd video

# Adding user
useradd -U -m -G wheel,audio,video,storage -s /bin/bash gamer -p gamer

# Making sure sudo is installed
apt install -y sudo
# Adding them to admin sudoers file
echo "box  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Update alias command to with user
alias jakbox="proot-distro login debian --user gamer --shared-tmp --no-sysvipc"' >> ~/.bashrc
# Update alias command to with user and for steam
alias jakboxsteam="proot-distro login debian --user gamer --shared-tmp "' >> ~/.bashrc
