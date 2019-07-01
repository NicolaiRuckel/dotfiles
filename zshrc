###########
## NOTES ##
###########

# use with oh-my-zsh

###############
## OH-MY-ZSH ##
###############

# set PATH
export PATH_LOCAL=/home/nicolai/bin
export PATH_DOTFILES=/home/nicolai/dotfiles/bin
export PATH_RUBY=/home/nicolai/.gem/ruby/2.6.0/bin
export PATH_RUST=$HOME/.cargo/bin
export GOPATH=$HOME/dev/go

export PATH=$PATH_LOCAL:$PATH_DOTFILES:$PATH_RUBY:$PATH_RUST:$PATH

if [ -d ~/.texmf ] ; then
    export TEXMFHOME=~/.texmf
fi

# Path to your oh-my-zsh installation.
export ZSH=/home/nicolai/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="nidoranarion/nidoranarion"

# Enable auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/dotfiles/oh-my-zsh-themes

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  gitfast
  aws
  mvn
  gradle
  compleat
  z
)

source $ZSH/oh-my-zsh.sh

##########################
### User configuration ###
##########################

# ZSH options
# ###########

bindkey "^R" history-incremental-pattern-search-backward

# reduce key timeout from 0.4 seconds to 0.1 seconds
export KEYTIMEOUT=1

# execute history expansion immediately
unsetopt HIST_VERIFY

# share history between sessions
setopt SHARE_HISTORY

# don't match dotfiles
setopt noglobdots

# Variables
# #########

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export VISUAL='nvim-qt'

export TERMINAL=gnome-terminal

export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export JAVA_HOME=/usr/lib/jvm/default
export GIT_EDITOR=nvim
export NVIM_GTK_NO_HEADERBAR=1

# aliases
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --abbrev-commit --date=relative -n20"
# alias v=nvim-gtk
alias f="files . &"
alias l="ls -lh"
alias o=open
alias vim=nvim

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

###############
## FUNCTIONS ##
###############

v() {
    "${VISUAL-vi}" "$@"
}

source /etc/profile.d/autojump.sh

export LS_COLORS="fi=0:di=34:ln=35:so=36:pi=33:ex=32:bd=34:cd=34:su=34:sg=34:tw=34:ow=34:"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# git completion
autoload -Uz compinit && compinit

# added by travis gem
[ -f /home/nicolai/.travis/travis.sh ] && source /home/nicolai/.travis/travis.sh
