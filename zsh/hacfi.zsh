export LANG="en_US.utf-8"
export LC_COLLATE="en_US.utf-8"
export LC_CTYPE="en_US.utf-8"
export LC_MESSAGES="en_US.utf-8"
export LC_MONETARY="en_US.utf-8"
export LC_NUMERIC="en_US.utf-8"
export LC_TIME="en_US.utf-8"

export EDITOR=vim

export GREP_OPTIONS="--color=always"

# zsh plugins: brew composer encode64 gem git github history node npm osx rsync rvm sublime symfony2

alias l='ls -lAh'

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
function mcd() { mkdir -p "$1" && cd "$1"; }
alias mcd='nocorrect mcd'
alias rp='cd `pwd -P`'
alias scp='nocorrect scp'
alias t='tree -afhilsF -L 1'
alias t1='tree -ahlsF -L 1'
alias t2='tree -afhilsF -L 2'


alias fhistory="history | grep -i "
alias cleandir='find . -name ".DS_Store" -delete'

alias mtr='nocorrect mtr'
alias netlisteners='sudo lsof -i -P | grep LISTEN'


function sshauth() {
  ssh "$1" 'mkdir -p -m 0700 ~/.ssh && cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
}

alias highmem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'

alias tar='nocorrect tar'

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

alias glp='git log --graph --pretty=pretty-history --abbrev-commit --date=relative'

function gitlc() {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  if [ $minutes_since_last_commit -le 120 ]
  then
    echo $minutes_since_last_commit minutes since last commit
  else
    echo $(($minutes_since_last_commit/60)) hours since last commit
  fi
}

function gdiff() {
    xr=$(git diff HEAD --stat 2>&1) || xr=""
    #echo "$xr"
    if [[ $xr != '' ]]; then
        git diff HEAD --stat 2>&1
    fi
}

function glog() {
    br=$(glp -n 12 2>&1) || br=""
    echo "$br"
}


function ghclone() {
    while read line; do git clone git@github.com:$line.git /var/www/github/$line; done
}

function ghrepos() {
  curl -s https://api.github.com/users/$1/repos | grep -i full_name | cut -d : -f 2 | cut -d \" -f 2
}


dbcreate () { echo "CREATE DATABASE $1" | mysql }
dbdrop () { echo "DROP DATABASE $1" | mysql }

function gitroot() {
  dir=${PWD%/$1/*}/$1
  while [[ $PWD != '/' && ! -d .git ]]; do cd ..; done
  if [ $PWD = '/' ]; then
    cd "$dir";
  fi
}
alias gitroot.='.. && gitroot'

function sfroot() {
  dir=${PWD%/$1/*}/$1
  while [[ $PWD != '/' && ! -f composer.json ]]; do cd ..; done
  if [ $PWD = '/' ]; then
    cd "$dir";
  fi
}
alias sfroot.='.. && sfroot'

function sfpermission() {
  chmod 0777 app/cache app/logs app/var/sessions
}

alias cll='rm app/logs/*.log'
alias sfcl='rm -rf app/cache/*'
alias sfdc='sf doctrine:database:create'
alias sfdd='sf doctrine:database:drop'
alias sfsc='sf doctrine:schema:create'
alias sfsu='sf doctrine:schema:update --dump-sql && sf doctrine:schema:update --force'
alias sfge='sf doctrine:generate:entity'
alias sfges='sf doctrine:generate:entities'
alias sfgb='sf generate:bundle'
alias sfcrud='sf doctrine:generate:crud'
alias sfform='sf doctrine:generate:form'
alias sfsr='sf server:run'
alias sfr='sf router:debug -e=prod'
alias sfrd='sf router:debug -e=dev'
alias sfgesnb='sf doctrine:generate:entities --no-backup'
alias sfpop='sf fos:elastica:populate'

alias twigcache='grep -r "^/\*" app/cache/dev/twig | grep "html\.twig"'


