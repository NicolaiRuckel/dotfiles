autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{184}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{197}●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

theme_precmd () {
    # check if current branch is ahead
    if $(echo "$(git log origin/$(git_current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
        zstyle ':vcs_info:*' formats ' [%b%m%u%c%F{077}●%F{green}]'
    else
        zstyle ':vcs_info:*' formats ' [%b%m%u%c%F{green}]'
    fi

    vcs_info
}

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{170}●%f'
  fi
}

user_symbol="%B%F{green}\$%b%f"
if [[ $UID == 0 || $EUID == 0 ]]; then
        user_symbol="%B%F{red}#%b%f"
fi

setopt prompt_subst
local NEWLINE=$'\n'
PROMPT='%B%F{blue}%3~%B%F{green}${vcs_info_msg_0_}%b%f${NEWLINE}${user_symbol} '
RPROMPT='%T'

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
