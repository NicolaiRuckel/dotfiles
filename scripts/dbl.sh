#!/bin/bash

# monitor setup for dbl

RIGHT_DISPLAY="--output DP-1 --primary --auto"
LEFT_DISPLAY="--output HDMI-1 --auto --left-of DP-1"

xrandr $LEFT_DISPLAY $RIGHT_DISPLAY
