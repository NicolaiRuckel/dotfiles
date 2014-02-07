#!/bin/bash

# create symlinks

# for all OS
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/vimperatorrc ~/.vimperatorrc
ln -s ~/dotfiles/pentadactylrc ~/.pentadactylrc
ln -s ~/dotfiles/zshrc ~/.zshrc

# for Linux only
OS=$(uname -s)
if [ $OS = "Linux" ]; then
    ln -s ~/dotfiles/i3status.conf ~/.i3status.conf
    echo 'ln -s ~/dotfiles/i3status.conf ~/.i3status.conf'
    ln -s ~/dotfiles/i3/config ~/.i3/config
    echo 'ln -s ~/dotfiles/i3/config ~/.i3/config'

    cp ~/.Xresources ~/dotfiles/backup/Xresources
    ln -s ~/dotfiles/Xresources ~/.Xresources
    echo 'ln -s ~/dotfiles/Xresources ~/.Xresources'

    cp ~/.xinitrc ~/dotfiles/backup/xinitrc
    ln -s ~/dotfiles/xinitrc ~/.xinitrc
    echo 'ln -s ~/dotfiles/xinitrc ~/.xinitrc'
fi

# install vim plugins
git clone git://github.com/tpope/vim-pathogen.git ~/.vim/bundle/vim-pathogen
mkdir ~/.vim/bundle
git clone git://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/othree/html5.vim.git ~/.vim/bundle/html5.vim
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git://github.com/tpope/vim-git ~/.vim/bundle/vim-git
git clone git://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone git://github.com/jonathanfilip/vim-lucius ~/.vim/bundle/vim-lucius

# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
