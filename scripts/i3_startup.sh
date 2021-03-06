#!/bin/bash

#  VARIABLES
LAPTOP_HOSTNAME="archbook"
DESKTOP_HOSTNAME="snitsig"

#  stop screen from turning off after inactivity
xset -dpms s off

# set menu to be the compose key
setxkbmap -option compose:menu

# keyboard settings
~/dotfiles/scripts/keyboard.sh

case $HOSTNAME in
    ("$LAPTOP_HOSTNAME")
    #  laptop specific settings

    (compton --backend glx --paint-on-overlay --vsync opengl-swc --no-fading-openclose) &
    ~/dotfiles/scripts/laptop-touchpad-settings.sh;;

    ("$DESKTOP_HOSTNAME")
    #  desktop specific settings
    compton --backend glx --paint-on-overlay --vsync opengl-swc &

    export QT_AUTO_SCREEN_SCALE_FACTOR=2
    export GDK_SCALE=2
    export ELM_SCALE=2

    ~/dotfiles/scripts/desktop_monitor.sh;;

    ("curie")
      picom -b --vsync --use-damage --glx-no-stencil --backend xr_glx_hybrid

      # logitech mouse
      xinput set-button-map 11 1 6 3 4 5 2 7 8 9 10 11 12;

      # start applications
      i3-msg "exec com.discordapp.Discord"
      i3-msg "exec riot-desktop"
      i3-msg "exec com.skype.Client"

      i3-msg "exec firefox"
      i3-msg "exec thunderbird"

      # displays
      ~/dotfiles/scripts/dbl.sh;;

esac
