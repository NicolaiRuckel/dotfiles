#!/bin/bash
#
# This script toggles the extended monitor outputs if something is connected
#

# your notebook monitor
DEFAULT_OUTPUT='eDP1'

# outputs to toggle if connected
OUTPUTS='DP1 DP2 HDMI1 HDMI2'

# get info from xrandr
XRANDR=`xrandr`

EXECUTE="xrandr --output $DEFAULT_OUTPUT --auto "

for CURRENT in $OUTPUTS
do
        if [[ $XRANDR == *$CURRENT\ connected*  ]] # is connected
        then
                if [[ $XRANDR == *$CURRENT\ connected\ \(* ]] # is disabled
                then
                        EXECUTE+="--output $CURRENT --auto --same-as $DEFAULT_OUTPUT "
                else
                        EXECUTE+="--output $CURRENT --off "
                fi
        else # make sure disconnected outputs are off
                EXECUTE+="--output $CURRENT --off "
        fi
done

echo "$EXECUTE"
$EXECUTE
