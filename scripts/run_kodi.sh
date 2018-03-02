#!/bin/bash

# suspend dunst
killall -SIGUSR1 dunst

# disable all but one display
xrandr --output DP-1 --auto --output HDMI-0 --off

# run kodi
kodi

# restore display layout
source ~/dotfiles/scripts/desktop_monitor.sh

# resume dunst
killall -SIGUSR2 dunst
