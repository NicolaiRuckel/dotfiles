#!/bin/bash

USER="nicolai"
HOST="192.168.0.5"
BACKUP_FOLDER="backups/"

EXCLUDE="--exclude=.Trash* --exclude=downloads --exclude=desktop --exclude=.cache"

rsync -avP --delete-excluded $EXCLUDE -e ssh ~ $USER@$HOST:$BACKUP_FOLDER

