#!/bin/sh

# generate lockscreen image
scrot /tmp/lockscreenimage.png
convert /tmp/lockscreenimage.png -scale 10% -scale 1000% /tmp/lockscreenimage.png

# turn off display
xset dpms force off

# lock screen
i3lock -n -i /tmp/lockscreenimage.png

xset -dpms s off
