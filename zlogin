case `uname -n` in
        xps)
                if [ "$(tty)" = "/dev/tty1" ]; then
                        eval $(keychain --eval id_rsa)
                        exec sway
                fi
                ;;
        snitsig)
                if [ "$(tty)" = "/dev/tty1" ]; then
                        eval $(keychain --eval id_rsa)
                        exec sway
                fi
                ;;
esac
