#!/bin/bash

# monitor setup for dbl

RIGHT_DISPLAY="--output DP-1 --primary --auto"
LEFT_DISPLAY="--output DP-2 --auto --left-of DP-1 --rotate normal"

xrandr $LEFT_DISPLAY $RIGHT_DISPLAY
