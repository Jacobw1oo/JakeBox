#!/bin/sh
killall -9 termux-x11 pulseaudio virgl_test_server_android
termux-wake-lock; termux-toast "Starting Debian Liunx"

# Termux-X11 start
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
df | grep /storage | cut -d "/" -f 4-

# X11 start
XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac -extension MIT-SHM &
virgl_test_server_android &
sleep 3

# Audio server
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

# Linux login
touch ~/something
proot-distro login --bind ~/something:/proc/bus/pci/devices debian --user hsm --shared-tmp --no-sysvipc -- bash -c "export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1:4713; MESA_NO_ERROR=1 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.6COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 dbus-launch --exit-with-session startxfce4"

proot-distro login --bind ~/something:/proc/bus/pci/devices debian --user hsm --shared-tmp --no-sysvipc -- bash -c "export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1:4713; MESA_NO_ERROR=1 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.6COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 dbus-launch --exit-with-session startxfce4"
