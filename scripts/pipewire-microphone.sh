#!/bin/bash

# If I use the inputs of my Focusrite Scarlett 2i2 with a mono microphone it
# give me a stereo signal where the right channel is silent.  This script
# creates a new `mono-mic` source that takes the signal from the 2i2 mapped to
# a mono channel.  Thanks to hdp from #pipewire.

pactl load-module module-null-sink object.linger=1 media.class=Audio/Source/Virtual sink_name=mono-mic channel_map=mono
pw-jack jack_connect 'Focusrite Scarlett 2i2 2nd Gen Analog Stereo:capture_FL' 'mono-mic Audio/Source/Virtual sink:input_MONO'
