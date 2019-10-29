# Set keyboard to US international
setxkbmap us altgr-intl

# Change keyboard repeat rate
xset r rate 250 50

# Run systemd as user instance
systemd --user &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xrdb ~/.Xresources &

export DE="kde"
export KDE_FULL_SESSION=true
export KDE_SESSION_VERSION="5"

# Start Gnome Keyring
# See: https://wiki.archlinux.org/index.php/GNOME/Keyring#PAM_method
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# start i3
# case `uname -n` in
#     archbook)
#     export LC_ALL=C
#     exec i3
# esac
