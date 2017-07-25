#!/bin/sh
num="$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')" &&

label="$(zenity --entry --title='Change workspace label'\
                --text='Enter new workspace label' 2>/dev/null)" &&

if [ -z $label ]; then
    name="$num"
else
    name="$num:$label"
fi &&

i3-msg rename workspace to $name
