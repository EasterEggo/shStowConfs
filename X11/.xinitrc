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
xsetwacom set 22 Rotate half &

feh --bg-fill ~/wallpapers/catppuccin-arch-dark.png &

dunst &

#/usr/bin/emacs --daemon &

#~/.config/dwm-6.2/dwbar &
#exec /usr/local/bin/dwm
#exec /usr/bin/awesome
/usr/bin/qtile start
# exec budgie-desktop
# exec gnome-session
