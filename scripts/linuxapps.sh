#!/bin/bash
#Part 8 - Debian User - Installing easy apps from debian repo
#linuxapps.sh

# installing firefox
sudo apt install -y firefox-esr playonlinux

# cheadrian idea on how to easily make sure when start containers on playonlinux correctly, I like it, 
echo '#!/bin/bash -i
export BOX86_NOBANNER=1 BEFORE_WINE=box86
playonlinux' > /usr/local/bin/playonlinux32
chmod +x /usr/local/bin/playonlinux32

echo '#!/bin/bash -i
export BOX64_NOBANNER=1 BEFORE_WINE=box64
box64 playonlinux' > /usr/local/bin/playonlinux64
chmod +x /usr/local/bin/playonlinux64

echo '[Desktop Entry]
Version=1.0
Name=PlayOnLinux Box
Comment=Front-end application for the wine
Type=Application
Exec=bash -i -c "source ~/.bashrc && BEFORE_WINE=box86 playonlinux %F"
Icon=playonlinux
Categories=Utility;Emulator;' > ~/Desktop/PlayOnLinux_box.desktop
chmod +x ~/Desktop/PlayOnLinux_box.desktop
cp ~/Desktop/PlayOnLinux_box.desktop /usr/share/applications/

echo '[Desktop Entry]
Version=1.0
Name=PlayOnLinux Box64
Comment=Front-end application for the wine
Type=Application
Exec=bash -i -c "source ~/.bashrc && BEFORE_WINE=box64 box64 playonlinux %F"
Icon=playonlinux
Categories=Utility;Emulator;' > ~/Desktop/PlayOnLinux_box64.desktop
chmod +x ~/Desktop/PlayOnLinux_box64.desktop
cp ~/Desktop/PlayOnLinux_box64.desktop /usr/share/applications/
# End of cheadrian section 