#!/bin/bash

exclude=".Trash*"
sudo rsync -av --exclude=$exclude -e ssh /media/data nicolai@vilgot:CloudStation/

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
