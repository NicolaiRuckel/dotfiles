#!/bin/bash

#  VARIABLES

LAPTOP_HOSTNAME="archbook"
DESKTOP_HOSTNAME="snitsig"

# needed when i3 is started via sddm

xset r rate 350 50

#  stop screen from turning off after inactivity
xset -dpms s off

# set menu to be the compose key
setxkbmap -option compose:menu

export QT_QPA_PLATFORMTHEME="qt5ct"

case $HOSTNAME in
    ("$LAPTOP_HOSTNAME")
    #  laptop specific settings

    (compton --backend glx --paint-on-overlay --vsync opengl-swc --no-fading-openclose) &
    ~/dotfiles/scripts/laptop-touchpad-settings.sh;;

    ("$DESKTOP_HOSTNAME")
    #  desktop specific settings
    compton --backend glx --paint-on-overlay --vsync opengl-swc &
    ~/dotfiles/scripts/desktop_monitor.sh;;

    ("curie")
      compton -b --paint-on-overlay --unredir-if-possible --backend xr_glx_hybrid --vsync drm --glx-swap-method -1 --glx-no-stencil --no-fading-openclose

      # logitech mouse
      xinput set-button-map 11 1 6 3 4 5 2 7 8 9 10 11 12;

      # start applications
      i3-msg "exec com.discordapp.Discord"
      i3-msg "exec pidgin"
      i3-msg "exec evolution"
      i3-msg "exec firefox"

      # displays
      ~/dotfiles/scripts/dbl.sh;;

esac
