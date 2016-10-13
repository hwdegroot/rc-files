#!/usr/bin/env bash

#WIDTH=${1:-1920}
#HEIGHT=${2:-1080}
#RATE=${3:-60.00}
#Modeline=$(cvt $WIDTH $HEIGHT $RATE | grep -Po "(?<=Modeline).*")
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsyn

#for display in (HDMI-1 HDMI-2 eDP-1 DP-1 DP-2); do
#done
xrandr --addmode eDP-1 "1920x1080_60.00"
xrandr --addmode HDMI-1 "1920x1080_60.00"
xrandr --addmode HDMI-2 "1920x1080_60.00"
xrandr --addmode DP-1 "1920x1080_60.00"
xrandr --addmode DP-2 "1920x1080_60.00"
xrandr --output eDP-1 --mode "1920x1080_60.00"

i3-msg restart

