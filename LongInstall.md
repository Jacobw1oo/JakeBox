Manual installation, start at termux
```bash
curl -s -o ~/terminalstart.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/terminalstart.sh && chmod +x terminalstart.sh
```
```bash
curl -s -o ~/part1.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/part1.sh && chmod +x ~/part1.sh && . ~/part1.sh 
```
Now we have to download the network & apt fixing into the chroot
```bash
curl -s -o ~/ubuntu/root/part2.sh https://raw.githubusercontent.com/Jacobw1oo/JakeBox/main/scripts/part2.sh
```
Once completed run terminalstart.sh to enter the chroot, then run part2
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
