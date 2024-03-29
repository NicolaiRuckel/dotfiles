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

DISABLE_UPDATE_PROMPT=true
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=~/dotfiles/oh-my-zsh-custom
ZSH_THEME="nidoranarion/nidoranarion"

ENABLE_CORRECTION="true"

plugins=(
  gitfast
  compleat
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

##########################
### User configuration ###
##########################

# execute history expansion immediately
unsetopt HIST_VERIFY

# share history between sessions
setopt SHARE_HISTORY

# don't match dotfiles
setopt noglobdots

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  alias vim=nvim
fi

export VISUAL='nvim'
export TERMINAL=alacritty
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export JAVA_HOME=/usr/lib/jvm/default
export GIT_EDITOR=nvim
export NVIM_GTK_NO_HEADERBAR=1

export BAT_THEME='GitHub'

# Don’t suggest dotfiles for correction
export CORRECT_IGNORE_FILE='.*'

# reduce key timeout from 0.4 seconds to 0.1 seconds
export KEYTIMEOUT=1

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

alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --abbrev-commit --date=relative -n20"
alias f="files . &"
alias l="ls -lhp"
alias o="open"
alias cvenv='python -m venv .venv && source .venv/bin/activate && pip install --upgrade pip setuptools > /dev/null'

alias rm='echo "This is not the command you are looking for. Prepend it with a backslash if you *really* want to use it."; false'
alias tp=trash-put

# cd with ranger
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

bindkey "^R" history-incremental-pattern-search-backward

# fix delete key behaviour
bindkey '^[[3~' delete-char

# open ranger with ctrl o; clear line first
bindkey -s '^o' '^l\nranger\n'

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

###############
## FUNCTIONS ##
###############

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# git completion
autoload -Uz compinit && compinit

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

bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

zle -N expand-multiple-dots
zle -N expand-multiple-dots-then-expand-or-complete
zle -N expand-multiple-dots-then-accept-line
bindkey '^I' expand-multiple-dots-then-expand-or-complete
bindkey '^M' expand-multiple-dots-then-accept-line
# end expand multiple dots

function sysupdate() {
        sudo reflector \
                --verbose \
                --country Germany \
                --age 12 \
                --protocol https \
                --sort rate \
                --save /etc/pacman.d/mirrorlist;\
                flatpak update;\
                yay
}

# from https://superuser.com/a/767491
if [[ `uname` == Darwin ]]; then
    MAX_MEMORY_UNITS=KB
else
    MAX_MEMORY_UNITS=MB
fi

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"
fi

if uname -r |grep -q 'Linux' ; then
	source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh
fi

if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    # https://github.com/sakai135/wsl-vpnkit
    wsl.exe -d wsl-vpnkit service wsl-vpnkit start

    GPG_TTY=$(tty)
    export GPG_TTY

    eval $(keychain --eval --quiet --gpg2 --agents gpg,ssh id_rsa)
fi

add-zsh-hook -Uz precmd rehash_precmd
#export DOCKER_HOST=tcp://localhost:2375

export PATH="$HOME/.poetry/bin:$PATH"
