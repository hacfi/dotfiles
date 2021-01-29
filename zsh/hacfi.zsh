export LANG="en_US.utf-8"
export LC_COLLATE="en_US.utf-8"
export LC_CTYPE="en_US.utf-8"
export LC_MESSAGES="en_US.utf-8"
export LC_MONETARY="en_US.utf-8"
export LC_NUMERIC="en_US.utf-8"
export LC_TIME="en_US.utf-8"

export EDITOR=vim

# export GREP_OPTIONS="--color=always"
alias grepc="grep --color=always "

alias l='ls -lFAh'
alias la='ls -lFah'
alias lsd="ls -1F | grep --color=never '\/$'"


alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

function mcd() { mkdir -p "$1" && cd "$1"; }
alias mcd='nocorrect mcd'

alias rp='cd `pwd -P`'
alias j=jump

alias m="if [[ -f .notes/Makefile ]]; then make -f .notes/Makefile; else make; fi"

alias t='tree -afhilsF -L 1'
alias t1='tree -ahlsF -L 1'
alias t2='tree -afhilsF -L 2'

alias fhistory="history | grep -i "
alias cleandir='find . -name ".DS_Store" -exec rm -fv {} \;'

alias mtr='nocorrect mtr'
alias oports='sudo lsof -i -P | grep LISTEN'
alias osockets='sudo lsof -U | grep sock'


function sshauth() {
  ssh "$1" 'mkdir -p -m 0700 ~/.ssh && cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
}


function ssh() {
  if [[ -f .ssh_config ]]; then
    /usr/bin/ssh -F .ssh_config "$@";
  else
    /usr/bin/ssh "$@";
  fi
}


function scp() {
  if [[ -f .ssh_config ]]; then
    /usr/bin/scp -F .ssh_config "$@";
  else
    /usr/bin/scp "$@";
  fi
}

alias highmem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'

alias tar='nocorrect tar'
function unrar1() {
  unrar e "$1" $(unrar lb "$1" | head -n 1)
}

alias mt='cat /dev/null >!'

function up() {
    dir=""
    if [ -z "$1" ]; then
        dir=..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
        dir=${PWD%/$1/*}/$1
    fi
    cd "$dir";
}

function upstr() {
    echo "$(up "$1" && pwd)";
}

alias ggfpush='git push -f origin "$(git_current_branch)"'


