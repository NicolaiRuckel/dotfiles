case `uname -n` in
        xps)
                if [ "$(tty)" = "/dev/tty1" ]; then
                        XDG_CURRENT_DESKTOP=sway
                        exec sway
                fi
                ;;
        snitsig)
                if [ "$(tty)" = "/dev/tty1" ]; then
                        XDG_CURRENT_DESKTOP=sway
                        exec sway
                fi
                ;;
esac
