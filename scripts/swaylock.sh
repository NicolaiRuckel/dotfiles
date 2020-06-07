#!/bin/bash

swaymsg "output * dpms off"
swaylock -f -c 000000
swaymsg "output * dpms on"
