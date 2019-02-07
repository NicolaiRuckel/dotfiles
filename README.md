Here are my dotfiles.  I made them for my machines, but they should work on any
other Linux machine or Mac.  Feel free to look and copy anything from these
files.  Sometimes I copied snippets from other resources.  Most of the time I
have referenced the source.  Check them if you want to use those.

## Setup

I use various submodules, so you should either clone the repository recursively
with

    git clone --recursive

or initialize the submodules after cloning the repository with

    git submodule init

### Symlinks
To create all the necessary symlinks, I copied a bash script from
[here](https://github.com/christopher-l/dotfiles/blob/master/deploy.sh).

### Vim/NVim plugins
To get all vim/nvim plugins, start vim/nvim and run
```
:PlugInstall
```
