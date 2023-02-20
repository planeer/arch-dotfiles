#!/bin/bash

if [ $(hostname) = "floyd" ]; then
	fix=$1 # Needed for a bug when xrandr doesn't set monitors correctly

	if [ -z "$fix" ]; then
		DP3pos="4480x390"
	else
		DP3pos="4480x391"
	fi

	xrandr \
		--output DP-0 --mode 2560x1440 --rate 165 --pos 1920x0 --primary \
		--output DP-2 --mode 1680x1050 --rate 60 --pos $DP3pos \
		--output HDMI-0 --mode 1920x1080 --rate 60 --pos 0x390
fi

feh --bg-fill ~/Documents/wallpaper.jpg

