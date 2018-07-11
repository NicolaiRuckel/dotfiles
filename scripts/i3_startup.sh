#!/bin/bash

#  VARIABLES

LAPTOP_HOSTNAME="archbook"
DESKTOP_HOSTNAME="snitsig"

# needed when i3 is started via sddm

xset r rate 250 50


#setxkbmap us altgr-intl
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# map capslock to control
xmodmap -e 'clear lock'
xmodmap -e 'clear control'
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'add control = Control_L Control_R'

export QT_QPA_PLATFORMTHEME="qt5ct"

case $HOSTNAME in
    ("$LAPTOP_HOSTNAME")
    #  laptop specific settings
    (compton --backend glx --paint-on-overlay --vsync opengl-swc --no-fading-openclose) &
    /home/nicolai/dotfiles/scripts/laptop-touchpad-settings.sh;
    #/home/nicolai/dotfiles/scripts/laptop-startup-apps.sh;

    #  stop screen from turning off after inactivity
    xset -dpms s off;;

    ("$DESKTOP_HOSTNAME")
    #  desktop specific settings
    /home/nicolai/dotfiles/scripts/desktop_monitor.sh;

    compton --backend glx --paint-on-overlay --vsync opengl-swc &

    #  stop screen from turning off after inactivity
    xset -dpms s off;;

    ("curie")
      compton -b --paint-on-overlay --unredir-if-possible --backend xr_glx_hybrid --vsync drm --glx-swap-method -1 --glx-no-stencil --no-fading-openclose
      xinput set-button-map 9 1 6 3 4 5 2 7 8 9 10 11 12;
      xset -dpms s off;
      /home/nicolai/dotfiles/scripts/dbl.sh;;
esac
