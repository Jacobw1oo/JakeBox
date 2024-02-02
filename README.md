# JakBox
Repo for quickly setuping up Proot with Termux, and installing GPU acceleration, Box64/86, Wine, Firefox-esr, Steam, Heroic, Lutris, PlayonLinux. 

Installation instructions

1. Install
[Termux](https://f-droid.org/repo/com.termux_118.apk),
[Termux-X11](https://raw.githubusercontent.com/Jacobw1oo/JakBox/main/components/termux-x11.apk) and
[Input Bridge](https://raw.githubusercontent.com/Jacobw1oo/JakBox/main/components/inputbridge.apk).

2. Open termux and paste command

```bash
curl -s -o ~/jakbox.sh https://raw.githubusercontent.com/Jacobw1oo/JakBox/main/jakbox.sh && . ~/jakbox.sh
```

3. Type `jakbox` in termux or `jakboxsys` if you need "--no-sysvipc".

#
Massive Thanks to [ptitSeb](https://github.com/ptitSeb/box86), without box86 & box64 non of this would be possible.

Thank these creators [Olegos2](https://github.com/olegos2/mobox), [Ilya114](https://github.com/Ilya114/Box64Droid/), [Cheadrian](https://github.com/cheadrian/termux-chroot-proot-wine-box86_64/), [Raezroth](https://github.com/Raezroth/Linux-ARM-Gaming-Chroot).

Big thanks to [Sporif](https://github.com/Sporif/dxvk-async),Hugo, JeezDisReez, MishkaKolos, Xanzo, Jotaros, Maxython and others for help.

## Third party applications

[glibc-packages](https://github.com/termux-pacman/glibc-packages)

[Box64](https://github.com/ptitSeb/box64)

[Box86](https://github.com/ptitSeb/box86)

[DXVK](https://github.com/doitsujin/dxvk)

[DXVK-ASYNC](https://github.com/Sporif/dxvk-async)

[DXVK-GPLASYNC](https://gitlab.com/Ph42oN/dxvk-gplasync)

[VKD3D](https://github.com/lutris/vkd3d)

[D8VK](https://github.com/AlpyneDreams/d8vk)

[Termux-app](https://github.com/termux/termux-app)

[Termux-x11](https://github.com/termux/termux-x11)

[Wine](https://wiki.winehq.org/Licensing)

[wine-ge-custom](https://github.com/GloriousEggroll/wine-ge-custom)

[Mesa](https://docs.mesa3d.org/license.html)

[mesa-zink-11.06.22](https://github.com/alexvorxx/mesa-zink-11.06.22)

[Mesa-VirGL](https://github.com/alexvorxx/Mesa-VirGL)
