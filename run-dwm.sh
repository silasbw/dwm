#!/bin/bash

tpset() { xinput set-prop "TPPS/2 IBM TrackPoint" "$@"; }
touchset() { xinput set-prop 'SynPS/2 Synaptics TouchPad' "$@"; }

tpset "Device Accel Constant Deceleration" 0.75
touchset "Device Enabled" 0

xsetroot -solid "#303030"
xset b off

eval $(/usr/bin/killall ssh-agent; /usr/bin/ssh-agent)

# https://wiki.archlinux.org/index.php/Java#Non-reparenting_window_managers
wmname LG3D

nm-applet &
stoken-gui &

while true
do
    status=$(date +'%a %b %e %l:%M')
    xsetroot -name "$status"
    sleep 1
done &

exec /home/sbw/usr/local/bin/dwm
