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
export PATH_RUST=$HOME/.cargo/bin
export GOPATH=$HOME/go

export PATH=$PATH_LOCAL:$PATH_DOTFILES:$PATH_RUST:$GOPATH/bin:$PATH

if [ -d ~/.texmf ] ; then
    export TEXMFHOME=~/.texmf
fi

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

ZSH_CUSTOM=~/dotfiles/oh-my-zsh-custom
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  gitfast
  compleat
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

##########################
### User configuration ###
##########################

# disable built-in oh-my-zsh aliases
unalias _
unalias '...'
unalias '....'
unalias '.....'
unalias '......'
unalias 1
unalias 2
unalias 3
unalias 4
unalias 5
unalias 6
unalias 7
unalias 8
unalias 9
unalias md
unalias rd

# Variables
# #########

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ZSH options
# ###########

# Don’t suggest dotfiles for correction
export CORRECT_IGNORE_FILE='.*'

bindkey "^R" history-incremental-pattern-search-backward

# reduce key timeout from 0.4 seconds to 0.1 seconds
export KEYTIMEOUT=1

# execute history expansion immediately
unsetopt HIST_VERIFY

# share history between sessions
setopt SHARE_HISTORY

# don't match dotfiles
setopt noglobdots

# fix delete key behaviour
bindkey '^[[3~' delete-char

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  alias vim=nvim
fi

export VISUAL='nvim'

export TERMINAL=gnome-terminal

export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export JAVA_HOME=/usr/lib/jvm/default
export GIT_EDITOR=nvim
export NVIM_GTK_NO_HEADERBAR=1

export BAT_THEME='GitHub'

# aliases
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --abbrev-commit --date=relative -n20"
alias f="files . &"
alias l="ls -lh"
alias o=open
alias cvenv='python -m venv .venv && source .venv/bin/activate && pip install --upgrade pip setuptools > /dev/null'

# cd with ranger
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# open ranger with ctrl o; clear line first
bindkey -s '^o' '^l\nranger\n'

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

###############
## FUNCTIONS ##
###############

# vim() {
#     "${VISUAL-vi}" "$@" 2> /dev/null
# }

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# git completion
autoload -Uz compinit && compinit

# added by travis gem
[ -f /home/nicolai/.travis/travis.sh ] && source /home/nicolai/.travis/travis.sh

# On demand reshash
# See https://wiki.archlinux.org/index.php/Zsh#On-demand_rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

# Set xterm title
# https://wiki.archlinux.org/index.php/zsh#xterm_title
function xterm_title_precmd () {
        print -Pn -- '\e]2;%n@%m %~\a'
        [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
        print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
        [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
        add-zsh-hook -Uz precmd xterm_title_precmd
        add-zsh-hook -Uz preexec xterm_title_preexec
fi

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

# taken from https://github.com/bellecp/fast-p
p() {
    open=xdg-open
    ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
        --preview-window down:80% --preview '
            v=$(echo {q} | tr " " "|");
            echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
        ' \
    | cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null $open > /dev/null 2> /dev/null
}

fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# find commands in history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}

# fuzzy cd
function fcd() {
    while true; do
        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}

# install packages with yay
function fyay() {
        yay -Slq | fzf -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

# Expand multiple dots
# https://github.com/parkercoates/dotfiles/blob/master/.zsh/expand-multiple-dots.zsh
function expand-multiple-dots() {
    local MATCH
    if [[ $LBUFFER =~ '(^| )\.\.\.+' ]]; then
        LBUFFER=$LBUFFER:fs%\.\.\.%../..%
    fi
}

function expand-multiple-dots-then-expand-or-complete() {
    zle expand-multiple-dots
    zle expand-or-complete
}

function expand-multiple-dots-then-accept-line() {
    zle expand-multiple-dots
    zle accept-line
}

# Copy slide template in current directory
function slides() {
rsync -av --progress $TEXMFHOME/tex/latex/beamer/issdark-beamer-theme/ .\
        --include='*.tex' \
        --include='*.sty' \
        --include='Makefile' \
        --include='latexmkrc' \
        --include='.gitignore' \
        --exclude='*'
}

zle -N expand-multiple-dots
zle -N expand-multiple-dots-then-expand-or-complete
zle -N expand-multiple-dots-then-accept-line
bindkey '^I' expand-multiple-dots-then-expand-or-complete
bindkey '^M' expand-multiple-dots-then-accept-line
# end expand multiple dots

# ssh-agent
# https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

add-zsh-hook -Uz precmd rehash_precmd
