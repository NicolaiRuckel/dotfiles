#!/bin/bash

# monitor setup for dbl

LEFT_DISPLAY="--output DP-2 --primary --auto"
RIGHT_DISPLAY="--output DP-1 --auto --right-of DP-2"

xrandr $LEFT_DISPLAY $RIGHT_DISPLAY
