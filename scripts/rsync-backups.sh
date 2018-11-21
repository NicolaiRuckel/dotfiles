#!/bin/bash

# use as root

USER="nicolai"
HOST="192.168.0.144"
BACKUP_FOLDER="backups/"

EXCLUDE="--exclude=.Trash* --exclude=/data/media/Incoming/* --exclude=/data/media/games/SteamLibrary/*"

rsync -avP --delete-excluded $EXCLUDE -e ssh /media/data $USER@$HOST:$BACKUP_FOLDER

#set -e
#
#args="-av --delete --numeric-ids --relative --delete-excluded"
#exclude="{/dev,/sys,/proc,/run,/mnt,/tmp,/media,/home/*/.cache}"
#
#rsync_command="rsync $args --exclude=$exclude \
#  $source/ /run/media/nicolai/Backups/snitsig"
#
#echo "$rsync_command"
#eval "$rsync_command"
