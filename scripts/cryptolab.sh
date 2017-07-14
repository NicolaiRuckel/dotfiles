#!/bin/bash

# monitor setup for media security lab

modeline=$(cvt 1920 1080 60 | tail -n1 | cut -d " " -f 2-)
modename=$(cvt 1920 1080 60 | tail -n1 | cut -d " " -f 2)

xrandr --newmode $modeline
xrandr --addmode $1 $modename
xrandr --output DP1 --auto --output $1 --mode $modename --left-of DP1

# nitrogen --restore
