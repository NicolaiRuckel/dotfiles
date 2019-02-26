#!/bin/bash

# set layout to us altgr-intl
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# set keyboard repeat rate
xset r rate 350 50

# set menu to be the compose key
setxkbmap -option compose:menu

# laptop settings
case $HOSTNAME in
  ("archbook")
    # map capslock to control
    xmodmap -e 'clear lock'
    xmodmap -e 'clear control'
    xmodmap -e 'keycode 66 = Control_L'
    xmodmap -e 'add control = Control_L Control_R'
    ;;
esac
