#!/bin/bash

# dependencies:
# wmctrl

wmctrl -r $1 -b add,demands_attention
