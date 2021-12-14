#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

feh --bg-fill wallpapers/pac1.jpg

pipewire &
pipewire-media-session &
pipewire-pulse &

picom &

udiskie-mount --all &

xset -dpms &
xset s off &

/usr/bin/emacs --daemon &

~/.config/dwm-6.2/dwbar &
exec /usr/local/bin/dwm
