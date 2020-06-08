case `uname -n` in
        xps)
                # If running from tty1 start sway
                if [ "$(tty)" = "/dev/tty1" ]; then
                        eval $(keychain --eval id_rsa)
                        exec sway
                fi
                ;;
esac
