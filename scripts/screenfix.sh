#!/bin/sh

#Example on how to setup new monitor modes
#this comand get you the specs for a new resolution ( example 1280x720 at 90Hz ) my 60 hz monitor is 59.94 Hz
#cvt 1280 720 89.91

#output
#1280x720 89.80 Hz (CVT) hsync: 68.34 kHz; pclk: 117.00 MHz
#Modeline "1280x720_89.91"  117.00  1280 1368 1496 1712  720 723 728 761 -hsync +vsync

#then we create the new mode
#xrandr --newmode "1280x720_90" 117.00  1280 1368 1496 1712  720 723 728 761 -hsync +vsync

# lastly we apply the new mode to our device ( my case it called screen, often it is called DP-1 or HDMI-1)
#xrandr --addmode screen 1280x720_90


xrandr --newmode "800x480_90" 47.50  800 840 920 1040  480 483 493 509 -hsync +vsync
xrandr --addmode screen 800x480_90

xrandr --newmode "800x600_90" 60.00  800 848 928 1056  600 603 607 635 -hsync +vsync
xrandr --addmode screen 800x600_90

xrandr --newmode "1024x768_90" 100.25  1024 1096 1200 1376  768 771 775 812 -hsync +vsync
xrandr --addmode screen 1024x768_90

xrandr --newmode "1280x720_90" 117.00  1280 1368 1496 1712  720 723 728 761 -hsync +vsync
xrandr --addmode screen 1280x720_90

xrandr --newmode "1280x960_90" 158.75  1280 1376 1512 1744  960 963 967 1014 -hsync +vsync
xrandr --addmode screen 1280x960_90

xrandr --newmode "1280x1024_90" 169.25  1280 1376 1512 1744  1024 1027 1034 1081 -hsync +vsync
xrandr --addmode screen 1280x1024_90

xrandr --newmode "1600x1024_90" 211.25  1600 1720 1888 2176  1024 1027 1037 1081 -hsync +vsync
xrandr --addmode screen 1600x1024_90

xrandr --newmode "1680x1050_90" 227.75  1680 1808 1984 2288  1050 1053 1059 1108 -hsync +vsync
xrandr --addmode screen 1680x1050_90

xrandr --newmode "1920x1080_90" 268.75  1920 2064 2272 2624  1080 1083 1088 1140 -hsync +vsync
xrandr --addmode screen 1920x1080_90
