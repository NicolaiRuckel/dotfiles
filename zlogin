case `uname -n` in
        xps)
                # If running from tty1 start sway
                if [ "$(tty)" = "/dev/tty1" ]; then
                        eval $(keychain --eval --agents gpg,ssh id_rsa)
                        exec sway
                fi
                ;;
esac
