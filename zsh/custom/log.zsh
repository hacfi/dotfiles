#!/usr/bin/env zsh

autoload -U add-zsh-hook

log_pwd_path() {
  if [ "$(id -u)" -ne 0 ]; then
    FULL_CMD_LOG=~/zsh_history.log;
    echo "`/bin/date '+%Y-%m-%d  %H%:%M:%S'`\t`pwd`\t\t`fc -n -l -1`" >> ${FULL_CMD_LOG}
  fi
}

add-zsh-hook precmd log_pwd_path
