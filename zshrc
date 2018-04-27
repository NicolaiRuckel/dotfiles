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
export PATH_RUBY=/home/nicolai/.gem/ruby/2.4.0/bin
export PATH_RUST=$HOME/.cargo/bin

export PATH=$PATH_LOCAL:$PATH_DOTFILES:$PATH_RUBY:$PATH_RUST:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/nicolai/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

local user_symbol="%{$FG[046]%}\$%{$reset_color%}"
if [[ $(print -P "%#") =~ "#" ]]; then
        user_symbol = "%{$FG[196]%}#%{$reset_color%}"
fi

# DEFAULT_USER=nicolai
POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=..
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$user_symbol "
# POWERLEVEL9K_ALWAYS_SHOW_USER=true
# POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_STATUS_OK=false
# POWERLEVEL9K_USER_ICON="\$"
# POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_USER_TEMPLATE=''
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status user)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs newline custom_prefix)
# POWERLEVEL9K_CUSTOM_PREFIX="echo '%{$FG[046]%}$user_symbol%{$reset_color%}'"
POWERLEVEL9K_CUSTOM_PREFIX="echo '$user_symbol'"
POWERLEVEL9K_CUSTOM_PREFIX_BACKGROUND='238'
POWERLEVEL9K_CUSTOM_PREFIX_FOREGROUND='046'
POWERLEVEL9K_DISABLE_RPROMPT=true
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs time)
# POWERLEVEL9K_STATUS_OK_BACKGROUND='33'
# POWERLEVEL9K_STATUS_ERROR_BACKGROUND='33'
POWERLEVEL9K_CONTEXT_BACKGROUND='033'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='046'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='196'
POWERLEVEL9K_DIR_HOME_BACKGROUND='033'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='033'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='033'
POWERLEVEL9K_DIR_HOME_FOREGROUND='255'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='255'
POWERLEVEL9K_VCS_DEFAULT_FOREGROUND='255'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='255'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='255'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='255'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='039'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='039'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='039'
POWERLEVEL9K_USER_BACKGROUND='033'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='046'
POWERLEVEL9K_USER_ROOT_FOREGROUND='196'


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [[ -x "$(command -v v)" ]]; then
  export VISUAL='v'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
###########################
## GENERAL CONFIGURATION ##
###########################

# variables

export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export JAVA_HOME=/usr/lib/jvm/default
export GIT_EDITOR=nvim


# aliases
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --abbrev-commit --date=relative -n20"
# alias v="NVIM_GTK_NO_HEADERBAR=1 nvim-gtk 2>/dev/null"
alias f="files . &"
alias l="ls -lsh"
alias o=open

# names directories: http://zshwiki.org/home/examples/aliasdirs
hash -d dotfiles=~/dotfiles
hash -d project=~/uni/Semester15/17-WS-Password-Hashing


if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

###############
## FUNCTIONS ##
###############

# prevent nested ranger instances
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

####################################
## SYSTEM DEPENDENT CONFIGURATION ##
####################################

# Mac OS stuff
case `uname` in
    Darwin)
        # variables
        export GNATPATH=/usr/bin/gnat

        #aliases
        alias gvim="mvim"

        #profiles
        zstyle ':chpwd:profiles:/Users/nicolai/Documents/Uni/Bachelor(|/|/*)' profile ada
        chpwd_profile_ada()
        {
            [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
            print "chpwd(): Switching to profile: $profile"
            export MACOSX_DEPLOYMENT_TARGET=10.9
            #export PATH="/usr/bin/gnat:$PATH"
        }
    ;;
esac

# Linux stuff
case `uname` in
    Linux)

        # aliases
        # alias hibernate="sudo pm-hibernate"

        #profiles
    ;;
esac

#####################################
## MACHINE DEPENDENT CONFIGURATION ##
#####################################

case `uname -n` in
    snitsig)

        # variables
        export GNATPATH=/opt/gnat2016/bin

        hash -d media=/media/nico/media

        #profiles
        zstyle ':chpwd:profiles:/home/nicolai/Documents/Uni/Bachelor(|/|/*)' profile ada
        chpwd_profile_ada()
        {
            [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
            print "chpwd(): Switching to profile: $profile"
            export PATH="$GNATPATH:$PATH"
        }
    ;;
esac

case `uname -n` in
    archbook)
        # variables
        export TERMINAL=termite
        export GNATPATH=/opt/gnat2016/bin


        #profiles
        zstyle ':chpwd:profiles:/home/nicolai/Documents/Uni/Bachelor(|/|/*)' profile ada
        chpwd_profile_ada()
        {
            [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
            print "chpwd(): Switching to profile: $profile"
            export PATH="$GNATPATH:$PATH"
        }
        ;;
esac

case `uname -n` in
    swagberrypi)
        # variables
        export TERM=linux
        ;;
esac

source /etc/profile.d/autojump.sh
