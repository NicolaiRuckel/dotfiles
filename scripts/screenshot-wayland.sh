#!/bin/bash

area=''
path=''

print_usage() {
  printf "Usage: ..."
}

while getopts 'ap:' flag; do
  case "${flag}" in
    a) area='true' ;;
    p) path="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

if [[ -z "$path" ]]; then
    path=$(xdg-user-dir PICTURES)/screenshots
fi

mkdir -p ${path}

filename=$(date +'screenshot_%Y-%m-%d-%H%M%S.png')

if [[ "${area}" ]]; then
    slurp | grim -g - ${path}/${filename}
else
    grim ${path}/${filename}
fi
