#!/bin/sh

#setxkbmap us altgr-intl
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# map capslock to control
xmodmap -e 'clear lock'
xmodmap -e 'clear control'
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'add control = Control_L Control_R'
