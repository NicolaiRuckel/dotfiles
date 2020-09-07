# [Dotfiles][dotfiles]

These are my dotfiles. I made them for my machines, but they should work on any
other Linux or macOS machine. Feel free to look and copy anything from these
files.

## Setup

I use various submodules, managed with [git-subrepo][git-subrepo].

Cloning the repository with

    git clone git@github.com:NicolaiRuckel/dotfiles.git

should give you all the necessary submodules.

### Symlinks

To create all the necessary symlinks, I copied a bash script from
[here][christoper-l-dotfiles].

## Dependencies

Software I use, that may need to be present for some configurations to work
properly. This list is probably incomplete.

### ZSH

* [oh-my-zsh](https://ohmyz.sh/)

#### ZSH Functions

* highlight
* fast-p
* pdftotext
* nvim

### Neovim

* [fzf](https://github.com/junegunn/fzf)
* [ag](https://github.com/ggreer/the_silver_searcher)

[dotfiles]: https://github.com/NicolaiRuckel/dotfiles
[git-subrepo]: https://github.com/ingydotnet/git-subrepo
[christopher-l-dotfiles]: https://github.com/christopher-l/dotfiles/blob/master/deploy.sh
[nord-gnome-terminal]: https://github.com/arcticicestudio/nord-gnome-terminal
