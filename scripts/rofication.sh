#!/bin/bash

# Don't show anything when there are zero notifications
OUTPUT=$(rofication-statusi3blocks.py)
if [[ ! $OUTPUT == "0" ]]; then
    echo "${OUTPUT}"
fi
