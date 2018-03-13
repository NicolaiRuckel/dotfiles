#!/bin/sh

function backup_home () {
    rsync -zauvc --exclude=.local/share/Trash/* --exclude=Desktop/* --exclude=Downloads/* --exclude=Dropbox/* -e ssh /home/nicolai root@snitsig:/media/nico/backups/laptop
}

function backup_music () {
    rsync -zauvc -e ssh /home/nicolai/Music root@snitsig:/media/nico/media
}

if [[ $EUID -ne 0 ]]; then
    echo "This script must be runned as root!" 1>&2
    exit 1
fi

############
##  MAIN  ##
############

echo '#############################'
echo '# syncing home directory... #'
echo '#############################'
backup_home

#echo '#############################'
#echo '# syncing music...          #'
#echo '#############################'
#backup_music
