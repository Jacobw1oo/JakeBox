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
