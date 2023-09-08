# Nidoranarion ZSH Theme
# Copyright (C) 2019-2023 Nicolai Ruckel

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%b%F{yellow}●%f'
zstyle ':vcs_info:*' unstagedstr '%b%F{red}●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git

function current_git_branch() {
    echo $(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
}

theme_precmd () {
    # check if current branch is ahead
    if $(echo "$(git log origin/$(current_git_branch)..HEAD 2> /dev/null)" | \
            grep '^commit' &> /dev/null); then
        zstyle ':vcs_info:*' formats ' [%b%m%u%c%F{green}●%f%B]'
    else
        zstyle ':vcs_info:*' formats ' [%b%m%u%c%f%B]'
    fi

    vcs_info
}

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%b%F{blue}●%f'
  fi
}

user_symbol="%B%F{green}\$%b%f"
if [[ $UID == 0 || $EUID == 0 ]]; then
        user_symbol="%B%F{red}#%b%f"
fi

setopt prompt_subst
local NEWLINE=$'\n'
PROMPT='%B%F{blue}%3~%f${vcs_info_msg_0_}%b%f${NEWLINE}${user_symbol} '

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd
