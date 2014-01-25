#!/bin/bash

#update all vim plugins
cd ~/dotfiles/vim/bundle
find . -maxdepth 1 -type d -exec sh -c '(cd {} && git pull)' ';'
