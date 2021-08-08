export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export WLR_DRM_NO_MODIFIERS=1

# Use Firefox on Wayland
#     https://wiki.archlinux.org/title/Firefox#Wayland
#     https://wiki.archlinux.org/title/Firefox#Applications_on_Wayland_can_not_launch_Firefox
#     https://www.reddit.com/r/archlinux/comments/ozubo9/using_firefox_on_wayland_make_sure_you_have_moz/
if [ $XDG_SESSION_TYPE == "wayland" ]; then
    export MOZ_DBUS_REMOTE=1
    export MOZ_ENABLE_WAYLAND=1
fi
