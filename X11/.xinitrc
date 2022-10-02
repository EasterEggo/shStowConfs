#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
pipewire &
pipewire-media-session &
pipewire-pulse &

picom &

udiskie-mount --all &

xset -dpms &
xset s off &
xsetroot -cursor_name left_ptr &

feh --bg-fill wallpapers/Big\ macOS\ Sur-8.jpg

#/usr/bin/emacs --daemon &

#~/.config/dwm-6.2/dwbar &
#exec /usr/local/bin/dwm
#exec /usr/bin/awesome
/usr/bin/qtile start
# exec budgie-desktop
