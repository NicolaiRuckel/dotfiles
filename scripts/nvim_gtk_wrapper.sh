#!/bin/sh

# Run `nvim-gtk` from the commandline.

echo $@
NVIM_GTK_NO_HEADERBAR=1 nvim-gtk $@ 2>/dev/null &
