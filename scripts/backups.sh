#!/bin/bash

USER="nicolai"
HOST="192.168.0.5"
BACKUP_FOLDER="backups/"

EXCLUDE="\
    --exclude=.local/share/Trash \
    --exclude=downloads \
    --exclude=desktop \
    --exclude=.cache \
    --exclude=.dropbox-dist \
    --exclude=.var \
    --exclude='*~' \
    --exclude='*.swp' \
    --exclude='*/Cache/*' \
    --exclude='*/cache/*\
    "
if ! [ $(id -u) = 0 ]; then
    rsync -avP --delete-excluded $EXCLUDE -e ssh ~ $USER@$HOST:$BACKUP_FOLDER
else
    echo "Don't run this as root!"
fi
