#!/bin/bash
# Yes, this is the same script as deploy.sh but it works with the old software
# that Apple gives me on my Mac. For some Reason they think 8 year old software
# would be sufficent to work. Hint: It's not.

dryrun=False

function print_usage () {
    echo "Usage: $0 [-n] TARGET..."
    echo "Create a symbolic link to each TARGET in your home directory."
    echo ""
    echo " -n: only print files to be linked without actually doing anything"
    echo ""
    echo "Existing files or or symlinks (to files or directories) will not be"
    echo "touched, but directories will be linked recursively, if the directory"
    echo "already exists in home."
    echo "This script and files starting with an underscore will be ignored."
    echo ""
    echo "In order to deploy all files issue"
    echo " $0 *"
    echo ""
}

function create_symlink () {
    if [[ -e "$HOME/.$1" ]] ; then
if [[ -h "$HOME/.$1" ]] ; then
printf "\033[0;32m"
            echo "$HOME/.$1: symlink exists"
            printf "\033[0m"
        elif [[ -f "$HOME/.$1" ]] ; then
printf "\033[0;31m"
            echo "$HOME/.$1: file exists"
            printf "\033[0m"
        else
for arg in "$1"/* ; do
create_symlink "$arg"
            done
fi
else
printf "\033[1;34m"
        echo "$HOME/.$1 --> $1"
        printf "\033[0m"
        if [[ "$dryrun" = "False" ]] ; then
ln -rs "$1" "$HOME/.$1"
        fi
fi
}

if [[ $# -le 0 ]] ; then
print_usage "$0"
    exit
fi

if [[ "$1" = "-n" ]] ; then
dryrun=True
    shift
fi


for arg in "$@" ; do
if [[ "$arg" != _* ]] && [[ "$0" != *"$arg" ]] && [[ "$arg" != README.md ]]  && [[ "$arg" != scripts ]] && [[ "$arg" != deploy.sh ]] && [[ "$arg" != i3 ]] && [[ "$arg" != Xresources ]] && [[ "$arg" != i3status.conf ]] && [[ "$arg" != xinitrc ]] ; then
if [[ -e "$arg" ]] ; then
create_symlink "$arg"
        else
echo "$arg: file not found"
            print_usage "$0"
            exit
fi
fi
done
