#!/bin/bash

# source:
# http://shop.lenovo.com/ae/en/laptops/thinkpad/t-series/t450s/#tab-tech_specs
BATTERY_UEVENT_LOCATION="/home/nicolai/dotfiles/scripts/battery/uevent"
touch $BATTERY_UEVENT_LOCATION

while true
do
  paste /sys/class/power_supply/BAT0/uevent /sys/class/power_supply/BAT1/uevent | awk '{split($0,a,"="); split(a[2],b," "); (a[3] == "Charging" || b[1] == "Charging") ? $5 = "Charging" : $5 = (a[3] + b[1])/2; print a[1] "=" $5}' > $BATTERY_UEVENT_LOCATION
  sleep 5
done
