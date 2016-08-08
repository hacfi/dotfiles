alias ginit='git init && git commit -m "Initial commit" --allow-empty'
alias ggfpush='git push origin -f $(current_branch)'
alias glp='git --no-pager log --graph --pretty=pretty-history --abbrev-commit --date=relative'

alias gitsize="du -d 0 -h .git | awk '{ print \$1 }'"
alias gitcommitcount="git rev-list --count HEAD"

# git last commit
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

# git diff - skip empty
function gdiff() {
    xr=$(git --no-pager diff HEAD --stat 2>&1) || xr=""
    if [[ $xr != '' ]]; then
        git --no-pager diff HEAD --stat 2>&1
    fi
}

# git log - last 15 commits
unalias glog
function glog() {
    br=$(git --no-pager log --graph --pretty=pretty-history --abbrev-commit --date=relative -n 15 2>&1) || br=""
    echo "$br"
}

function ghclone() {
    while read line; do git clone $line ~/src/github.com/$line; done
}

function ghrepos() {
  curl -s https://api.github.com/users/$1/repos | grep -i full_name | cut -d : -f 2 | cut -d \" -f 2
}

# cd to git root
function gitroot() {
  dir=${PWD%/$1/*}/$1
  while [[ $PWD != '/' && ! -d .git ]]; do cd ..; done
  if [ $PWD = '/' ]; then
    cd "$dir";
  fi
}
# cd to parent git root
alias gitroot.='.. && gitroot'


function addfork() {
    address=$(git remote -v | head -n 1 | awk '{ print $2 }' | sed 's/\(\w[:\/]\)\(\w\)\(.*\/\)\(.*\)/\1hacfi\/\4/' | sed 's/\(https:\/\/\)\(.*\)\(\/hacfi\)\(.*\)/git@\2:hacfi\4/' 2>&1)

    if read -q \?"git remote add fork $address? (y/n) "; then
        git remote add fork $address
    else
      return 1;
    fi

    echo

    if read -q \?"git fetch fork? (y/n) "; then
        git fetch fork
    fi
}

