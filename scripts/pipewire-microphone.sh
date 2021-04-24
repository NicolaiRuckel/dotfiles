#!/bin/bash

# If I use the inputs of my Focusrite Scarlett 2i2 with a mono microphone it
# give me a stereo signal where the right channel is silent.  This script
# creates a new `mono-mic` source that takes the signal from the 2i2 mapped to
# a mono channel.  Thanks to hdp from #pipewire.
#
# Originally I planned to start it when I boot my PC but for some reasons this
# does not work. I tried to create a systemd service file that depends on
# pipewire.service but that didn't help so for now I have to start it manually.

# Source to be mapped to the new input device. This changed at some point and
# therefore caused me a lot of trouble. I *think* it should end with
# "capture_FL", so you can find it with
#
#    $ pw-cli list-objects | rg capture_FL
#
SOURCE="Scarlett 2i2 USB:capture_FL"

# Create mono source
# https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Configuration#multichannel-cards
pactl load-module module-null-sink object.linger=1 media.class=Audio/Source/Virtual sink_name=mono-mic channel_map=mono

# Link input port to source of microphone port
pw-jack jack_connect "$SOURCE" 'mono-mic Audio/Source/Virtual sink:input_MONO'
