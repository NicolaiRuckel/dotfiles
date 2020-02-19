#!/bin/bash

# monitor setup for dbl

RIGHT_DISPLAY="--output DP-2 --off"
LEFT_DISPLAY="--output DP-1 --primary --auto"

xrandr $LEFT_DISPLAY $RIGHT_DISPLAY
