#!/bin/bash

# monitor setup for media security lab

LEFT_DISPLAY="--output DP1 --primary --auto"
RIGHT_DISPLAY="--output DP2 --auto --right-of DP1"
LAPTOP_DISPLAY="--output eDP1 --auto --left-of DP1"

xrandr $LEFT_DISPLAY $RIGHT_DISPLAY $LAPTOP_DISPLAY
