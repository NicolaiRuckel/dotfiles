# [Dotfiles](https://github.com/NicolaiRuckel/dotfiles)

These are my dotfiles.  I made them for my machines, but they should work on any
other Linux or macOS machine.  Feel free to look and copy anything from these
files.

## Setup

I use various submodules, so you should either clone the repository recursively
with

    git clone --recursive

or initialize the submodules after cloning the repository with

    git submodule init

### Symlinks

To create all the necessary symlinks, I copied a bash script from
[here](https://github.com/christopher-l/dotfiles/blob/master/deploy.sh).

### Neovim plugins

To get all Neovim plugins, start `nvim` and run
```
:PlugInstall
```

### Gnome Terminal Theme

Gnome Terminal does not have a configuration file for its themes, so the theme
has to be installed manually as shown [here](https://github.com/arcticicestudio/nord-gnome-terminal).

## Dependencies

Software I use, that may need to be present for some configurations to work
properly.

### ZSH

* [oh-my-zsh](https://ohmyz.sh/)

### Neovim

* [fzf](https://github.com/junegunn/fzf)
* [ag](https://github.com/ggreer/the_silver_searcher)
