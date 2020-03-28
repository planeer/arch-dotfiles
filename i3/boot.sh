#!/bin/bash

# Set monitor configuration
# TODO Find better solution for fix arg. This is needed because if we don't try to set monitors twice with any
# difference in resolutions or positions they are not set correctly
. ~/.config/i3/monitor.sh fix

if [ $(hostname) = "floyd" ]; then
	sleep 3 && . ~/.config/i3/monitor.sh
	
	# Auto start programs
	i3-msg "workspace 3; workspace 9; append_layout ~/.config/i3/workspace-9.json"
	teams &
	
	i3-msg "workspace 10; append_layout ~/.config/i3/workspace-10.json"
	slack &
	discord &
fi

