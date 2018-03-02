#!/bin/bash
#
# This script toggles the extended monitor outputs if something is connected
#

# your notebook monitor
DEFAULT_OUTPUT='DP-1'

# outputs to toggle if connected
OUTPUTS='DP-2 HDMI-0'

# get info from xrandr
XRANDR=`xrandr`

EXECUTE="xrandr --output $DEFAULT_OUTPUT --auto "

for CURRENT in $OUTPUTS
do
        if [[ $XRANDR == *$CURRENT\ connected*  ]] # is connected
        then
                if [[ $XRANDR == *$CURRENT\ connected\ \(* ]] # is disabled
                then
                        EXECUTE+="--output $CURRENT --auto --right-of $DEFAULT_OUTPUT "
                else
                        EXECUTE+="--output $CURRENT --off "
                fi
        else # make sure disconnected outputs are off
                EXECUTE+="--output $CURRENT --off "
        fi
done

echo "$EXECUTE"
$EXECUTE
