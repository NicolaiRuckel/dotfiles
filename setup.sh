#!/bin/bash
#create symlinks
ln -s ~/dotfiles/vim ~/.vim
echo 'ln -s ~/dotfiles/vim ~/.vim'
ln -s ~/dotfiles/vimrc ~/.vimrc
echo 'ln -s ~/dotfiles/vimrc ~/.vimrc'
ln -s ~/dotfiles/vimperatorrc ~/.vimperatorrc
echo 'ln -s ~/dotfiles/vimperator ~/.vimperator'
ln -s ~/dotfiles/pentadactylrc ~/.pentadactylrc 
echo 'ln -s ~/dotfiles/pentadactylrc ~/.pentadactylrc'
ln -s ~/dotfiles/zshrc ~/.zshrc
echo 'ln -s ~/dotfiles/zshrc ~/.zshrc'
ln -s ~/dotfiles/Xresources ~/.Xresources
echo 'ln -s ~/dotfiles/Xresources ~/.Xresources'
ln -s ~/dotfiles/i3status.conf ~/.i3status.conf
echo 'ln -s ~/dotfiles/i3status.conf ~/.i3status.conf'
#install vim plugins
git clone git://github.com/scrooloose/nerdtree.git ./vim/bundle/nerdtree
git clone git://github.com/scrooloose/syntastic.git ./vim/bundle/syntastic
git clone git://github.com/tpope/vim-pathogen.git ./vim/bundle/vim-pathogen
#install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 
