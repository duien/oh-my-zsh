# Yay! High voltage and arrows!

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats '%b%c%u%B%F{green} '
    } else {
        zstyle ':vcs_info:*' formats '%b%c%u%B%F{red}●%F{green} '
    }

    vcs_info
}

function rvm_version_string () {
  if [[ -s /Users/eprice/.rvm/scripts/rvm ]] ; then
    test "$(~/.rvm/bin/rvm-prompt i)" != "ruby" && echo "$(~/.rvm/bin/rvm-prompt i v g)" || echo "$(~/.rvm/bin/rvm-prompt v g)"
  fi
}

function rvm_prompt () {
  local r="$(rvm_version_string)"
  if [ -n "$r" ]; then
    echo "%{$fg[magenta]%}$r%{$fg[red]%}|%{$reset_color%}"
  fi
}


# ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}×%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_code="%(?..%{$fg[red]%}%?%{$reset_color%})"

PROMPT='%{$fg[cyan]%}%1~%{$reset_color%}%{$fg[red]%}|$(rvm_prompt)%{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%}%{$fg[cyan]%}>%{$reset_color%} '
RPS1="${return_code}"
