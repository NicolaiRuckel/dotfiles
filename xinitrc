#run systemd as user instance
systemd --user &
xset r rate 250 50

#setxkbmap us altgr-intl
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC

#scrolling with Thinkpad TrackPoint
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xrdb ~/.Xresources &
#xsetroot -cursor_name left_ptr

export DE="kde"
export KDE_FULL_SESSION=true
export KDE_SESSION_VERSION="5"

case `uname -n` in
    archbook)
    export LC_ALL=C
    exec i3
esac
