#!/bin/sh

# download video to watch it later
# takes a youtube link as argument

WATCHLATERDIR=~/downloads/watchlater

download()
{
  mkdir -p $WATCHLATERDIR
  cd $WATCHLATERDIR
  youtube-dl $1
}

alacritty -e download
