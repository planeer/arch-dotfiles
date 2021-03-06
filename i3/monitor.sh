#!/bin/bash

if [ $(hostname) = "floyd" ]; then
	fix=$1 # Needed for a bug when xrandr doesn't set monitors correctly

	if [ -z "$fix" ]; then
		DP3pos="3200x0"
	else
		DP3pos="3200x1"
	fi

	xrandr \
		--output HDMI-0 --mode 1920x1080 --rate 60 --pos 1280x0 --primary \
		--output DP-2 --mode 1680x1050 --rate 60 --pos $DP3pos \
		--output DP-1 --mode 1280x1024 --rate 60 --pos 0x0
fi

feh --bg-fill ~/Documents/wallpaper.jpg

