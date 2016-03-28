#!/bin/bash

# source:
# http://shop.lenovo.com/ae/en/laptops/thinkpad/t-series/t450s/#tab-tech_specs
# with modifications from:
# http://pastebin.com/Ddx7iQd9

BATTERY_UEVENT_LOCATION="/home/nicolai/dotfiles/scripts/battery/uevent"

touch $BATTERY_UEVENT_LOCATION

while true
do
  if [ -e /sys/class/power_supply/BAT1/uevent ]; then
    paste /sys/class/power_supply/BAT0/uevent /sys/class/power_supply/BAT1/uevent | awk '{split($0,a,"="); split(a[2],b," "); (a[3] == "Charging" || b[1] == "Charging") ? $5 = "Charging" : $5 = (a[3] + b[1])/2; print a[1] "=" $5}' > $BATTERY_UEVENT_LOCATION
  else
    cat /sys/class/power_supply/BAT0/uevent > $BATTERY_UEVENT_LOCATION
  fi
  sleep 5
done
