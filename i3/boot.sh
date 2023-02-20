#!/bin/bash

# Set monitor configuration
# TODO Find better solution for fix arg. This is needed because if we don't try to set monitors twice with any
# difference in resolutions or positions they are not set correctly
. ~/.config/i3/monitor.sh fix

if [ $(hostname) = "floyd" ]; then
	sleep 3 && . ~/.config/i3/monitor.sh
	
	# Auto start programs and move workspaces to correct monitor

	# Move workspace 1 to middle monitor and workspace 2 to left
	i3-msg "workspace 1; workspace 4; workspace 2; workspace 1; workspace 4; workspace 2"

	# Open on right monitor
	i3-msg "workspace 3; workspace 10; append_layout ~/.config/i3/workspace-10.json"
	slack &
	discord &

    # Open on left monitor
    i3-msg "workspace 2; workspace 9; append_layout ~/.config/i3/workspace-9.json"
    brave-nightly &
    chromium &

    i3-msg "workspace 8; append_layout ~/.config/i3/workspace-8.json"
    alacritty &
fi
