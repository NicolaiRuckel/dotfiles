#!/bin/sh

scrot /tmp/lockscreenimage.png
convert /tmp/lockscreenimage.png -scale 10% -scale 1000% /tmp/lockscreenimage.png
xset dpms force off
i3lock -i /tmp/lockscreenimage.png
xset -dpms s off
