#!/usr/bin/env bash

usage() {
  cat <<-USAGE
	Usage: `basename $0` display [width [height [refresh-rate]]]
	
	runs:
	  determine <mode>: cvt <width> <height> <refresh rate>
	  xrandr --newmode <mode>
	  xrandr --addmode <display> <mode>
	  xrandr --mode <mode> --output <display>
	
	display: apapter
	width,height,refresh rate: supported width x height _ refresh rate
	
	USAGE
  exit 1
}

if [[ -z "$1" ]] || [[ -z $(xrandr | grep $1) ]]; then
  usage
fi 

OUTPUT=${1}
WIDTH=${2:-1920}
HEIGHT=${3:-1080}
RATE=${4:-60.00}
params=( $(cvt $WIDTH $HEIGHT $RATE | grep -Po "(?<=Modeline ).*" | tr " " " ") )
xrandr --newmode ${params[*]} 
xrandr --addmode $OUTPUT ${params[0]}
xrandr --output $OUTPUT --mode ${params[0]}
#xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode eDP-1 "1920x1080_60.00"
#xrandr --output eDP-1 --mode "1920x1080_60.00"

i3-msg restart

