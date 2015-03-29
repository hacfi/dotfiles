#!/usr/bin/env zsh

# Colors
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

# Git theming
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[cyan]%}[on %{$fg_no_bold[default]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[cyan]%}] "
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[white]%}✰"

PR_GIT_UPDATE=1

setopt prompt_subst
autoload colors
colors

autoload -U add-zsh-hook
autoload -Uz vcs_info


zstyle ':vcs_info:*' enable git

# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
PR_RST="%{${reset_color}%}"
FMT_BRANCH="[%{$turquoise%}%b%u%c${PR_RST}]"
FMT_ACTION="[%{$limegreen%}%a${PR_RST}]"
FMT_UNSTAGED="%{$orange%}●"
FMT_STAGED="%{$limegreen%}●"

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

function steeef_preexec {
    case "$(history $HISTCMD)" in
        *git*)
            PR_GIT_UPDATE=1
            ;;
        *svn*)
            PR_GIT_UPDATE=1
            ;;
    esac
}
add-zsh-hook preexec steeef_preexec

function steeef_chpwd {
    PR_GIT_UPDATE=1
}
add-zsh-hook chpwd steeef_chpwd

function steeef_precmd {
    if [[ -n "$PR_GIT_UPDATE" ]] ; then
        # check for untracked files or updated submodules, since vcs_info doesn't
        if git ls-files --other --exclude-standard --no-empty-directory --directory 2> /dev/null | grep -q "."; then
            PR_GIT_UPDATE=1
            FMT_BRANCH="[%{$turquoise%}%b%u%c%{$hotpink%}●${PR_RST}] "
        else
            FMT_BRANCH="[%{$turquoise%}%b%u%c${PR_RST}] "
        fi
        zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd steeef_precmd


# Left prompt
export GITMODE=0
toggle_gitmode () {
  if [[ $GITMODE -eq 1 ]]; then
    export GITMODE=0
  else
    export GITMODE=1
  fi
}
zle -N toggle_gitmode
bindkey '^G' toggle_gitmode

show_git_diff () {
  if [[ $GITMODE -eq 1 ]]; then
    git_modification_files=$(git diff HEAD --stat=120,80 --color 2>&1) || git_modification_files=""
    if [[ -n $git_modification_files ]]; then
      echo ""
      git diff HEAD --stat=120,80 --color
      echo ' \n'
    fi
  fi
}

show_git_diff_stats () {
  # git_shortstats=$(git diff HEAD --shortstat 2>&1) || git_shortstats=""
  git_shortstats=$(git diff HEAD --shortstat 2>&1) || git_shortstats=""
  if [[ -n $git_shortstats ]]; then
    echo $(git diff HEAD --shortstat | sed s/\.changed// | sed s/ertions/\./ | sed s/etions/./)" "
  fi
}


log_pwd_path() {
  if [ "$(id -u)" -ne 0 ]; then
    FULL_CMD_LOG=~/zsh_history.log;
    echo "`/bin/date '+%Y-%m-%d  %H%:%M:%S'`\t`pwd`\t\t`fc -n -l -1`" >> ${FULL_CMD_LOG};
  fi
}

add-zsh-hook precmd log_pwd_path

local user="%{$fg_no_bold[cyan]%}%n"

typeset -A host_repr
host_repr=('achilles' "%{$fg[magenta]%}")
host_default="$(hostname -s)%{$fg_no_bold[cyan]%}"

local host="%{$fg[magenta]%}${host_repr[$(hostname -s)]:-@${host_default}}"

# local pwd="%{$fg_no_bold[green]%}%50<...<%d%<<%{$reset_color%}"
# local pwd="%{$fg_no_bold[green]%}%d%{$reset_color%}"
local pwd="%{$fg_no_bold[green]%}%~%{$reset_color%}"

local seperator="●%{$reset_color%}"

PROMPT='$(show_git_diff)${user}${host}${seperator}${pwd} $vcs_info_msg_0_
${SSH_CLIENT:+%#}» '


# Right prompt
time_enabled="%(?..%{$fg[red]%}%?%{$reset_color%}) [%(?..%{$fg[red]%})%*%{$reset_color%}]"
time_disabled="[%*]"
time=$time_enabled

RPROMPT='$(show_git_diff_stats)${time}'


function accept-line-or-clear-warning () {
    if [[ -z $BUFFER ]]; then
        time=$time_disabled
    else
        time=$time_enabled
    fi
    zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning

# _prompt_and_resched() { sched +1 _prompt_and_resched; zle && zle reset-prompt }
# _prompt_and_resched
# PS1="%D{%H:%M:%S} $PS1"
