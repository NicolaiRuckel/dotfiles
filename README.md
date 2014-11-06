Here are my dotfiles. I made them for my machines, but they should work on any
other Linux machine or Mac. Feel free to look and copy anything from these
files. Sometimes I copied snippets from other resources. Most of the time I
have referenced the source. Check them if you want to use those.

## Setup

### Vim plugins
I included all plugins I use as [submodules]
(http://git-scm.com/book/de/v1/Git-Tools-Submodule). To get them do
```
git submodule init
git submodule update
```

### ZSH
For my zsh configuration I use the zshrc from [grml](https://grml.org/zsh/).
Look at their site for setup and further configuration.

### Symlinks
To create all the necessary symlinks, I copied a bash script from [here]
(https://github.com/christopher-l/dotfiles/blob/master/deploy.sh).
