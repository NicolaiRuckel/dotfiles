case `uname -n` in
        xps)
                if [ "$(tty)" = "/dev/tty1" ]; then
                        exec sway
                fi
                ;;
        snitsig)
                if [ "$(tty)" = "/dev/tty1" ]; then
                        exec sway
                fi
                ;;
esac
