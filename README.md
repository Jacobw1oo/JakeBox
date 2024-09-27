# JakeBox
Repo for quickly setuping up Chroot with Termux, and installing GPU acceleration, Box64/86, Wine, Firefox-esr, Steam, Heroic, Lutris, PlayonLinux. 

Installation instructions

1. Install
[Termux](https://f-droid.org/repo/com.termux_118.apk),
[Termux-X11](https://raw.githubusercontent.com/Jacobw1oo/jakebox/main/components/termux-x11.apk)

2. (WIP) Open termux and paste command (dont have a loader built yet)

```bash
curl -s -o ~/jakebox.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/part1.sh && chmod +x ~/part1.sh && . ~/part1.sh 
```

3. (WIP) Type `jakebox` in termux or `jakeboxsys` if you need want terminal.

Manual installation, start at termux
```bash
curl -s -o ~/terminalstart.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/terminalstart.sh && chmod +x terminalstart.sh
```
```bash
curl -s -o ~/part1.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/part1.sh && chmod +x ~/part1.sh && . ~/part1.sh 
```

```bash
curl -s -o ~/ubuntu/root/part2.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/part2.sh
```
Once complete run terminalstart.sh to enter the chroot
```bash
bash ~/root/part2.sh 
```
```bash
curl -s -o ~/part3.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/part3.sh && bash ~/part3.sh 
```
now su gamer and enter user mode
```bash
curl -s -o ~/part4.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/part4.sh && bash ~/part4.sh 
```
lastly sorry there a few bugs and fixes that are in the script but never apply. Frist is passwd root, the rest commands are in part4 and mostly can just be copied and paste.
Commands below are for testing.
```bash
  update-binfmts --display
```
```bash
  cat /etc/environment
```
```bash
  ulimit -Hn
```
This fix can only be run after starting xfce4
#Edit your ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml file and change: vblank_mode from auto to off.

Last shm is super important and everytime i login chroot i have to remake it and relog.
```bash
  cd /dev/ && mkdir shm && chmod 777 shm && exit
```

#
Massive Thanks to [ptitSeb](https://github.com/ptitSeb/box86), without box86 & box64 non of this would be possible.

Thank these creators [Olegos2](https://github.com/olegos2/mobox), [Cheadrian](https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/), [xDoge26](https://github.com/xDoge26/proot-setup), [Ilya114](https://github.com/Ilya114/Box64Droid/), [Raezroth](https://github.com/Raezroth/Linux-ARM-Gaming-Chroot).

Big thanks to Hugo, JeezDisReez, MishkaKolos, Xanzo, Jotaros, Maxython and others for help.

## Third party credit - these software make this work.

[glibc-packages](https://github.com/termux-pacman/glibc-packages) - Termux Team

[Box64](https://github.com/ptitSeb/box64) - [ptitSeb](https://github.com/ptitSeb/box86)

[Box86](https://github.com/ptitSeb/box86) - [ptitSeb](https://github.com/ptitSeb/box86)

[DXVK](https://github.com/doitsujin/dxvk) - [doitsujin](https://github.com/doitsujin/dxvk)

[DXVK-ASYNC](https://github.com/Sporif/dxvk-async) - [Sporif](https://github.com/Sporif/dxvk-async)

[DXVK-GPLASYNC](https://gitlab.com/Ph42oN/dxvk-gplasync) [Ph42oN](https://gitlab.com/Ph42oN/dxvk-gplasync)

[VKD3D](https://github.com/lutris/vkd3d) - Lutris team

[D8VK](https://github.com/AlpyneDreams/d8vk) - [AlpyneDreams](https://github.com/AlpyneDreams/d8vk)

[Termux-app](https://github.com/termux/termux-app) - Termux Team

[Termux-x11](https://github.com/termux/termux-x11) - Termux Team

[Wine](https://wiki.winehq.org/Licensing) - Wine Team

[wine-ge-custom](https://github.com/GloriousEggroll/wine-ge-custom) - [GloriousEggroll](https://github.com/GloriousEggroll/wine-ge-custom)

[Mesa](https://docs.mesa3d.org/license.html) - Mesa Team
