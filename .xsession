#!/bin/bash

# animate ~/bin/init/nothing_matters.gif &
mpg123 ~/bin/init/real_trap_shit.mp3 &
source ~/.profile

# fix caps lock => ctrl
setxkbmap -option ctrl:nocaps

# set desktop background
feh --bg-scale /home/meandave/Pictures/the\ days\ of\ rage.jpg

#utils
unclutter -idle 1 &

# kill the animation
pkill animate

google-chrome &
xterm &

# gnome: the good parts
gnome-power-manager &
# gnome-screensaver &
xmobar &
dbus-launch --exit-with-session xmonad
