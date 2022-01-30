#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
dbus-launch

pipewire &
pipewire-media-session &
pipewire-pulse &

picom &

udiskie-mount --all &

xset -dpms &
xset s off &
xsetroot -cursor_name left_ptr &

feh --bg-fill wallpapers/2.png &

/usr/bin/emacs --daemon &

#~/.config/dwm-6.2/dwbar &
#exec /usr/local/bin/dwm
exec xmonad
