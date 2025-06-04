#!/bin/sh

picom &

udiskie-mount --all &

xset -dpms &
xset s off &
xsetroot -cursor_name left_ptr &

#feh --bg-fill ~/wallpapers/disco-conquest-wallpaper-4k.png &

xset b off &
xhost +SI:localuser:$USER &
export _JAVA_AWT_WM_NONREPARENTING=1 &
xset r rate 200 60 &

# odd issue with programs taking too long to launch
systemctl --user import-environment DISPLAY XAUTHORITY &
dbus-update-activation-environment DISPLAY XAUTHORITY &

#trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype request --tint 0x00000 --height 30 --distance 0 --margin 320 --transparent 1 --alpha 0 &

dunst &

xfce4-session &

exec qtile start
