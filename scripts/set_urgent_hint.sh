#!/bin/sh

# catch Evolution notifications
if [ "$1" == evolution-mail-notification ]; then
  wmctrl -r Evolution -b add,demands_attention
fi

wmctrl -r $1 -b add,demands_attention
