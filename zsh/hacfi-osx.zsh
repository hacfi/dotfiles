COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true
export COPY_EXTENDED_ATTRIBUTES_DISABLE COPYFILE_DISABLE

alias curdir='pwd | pbcopy'

alias lastmod='find . -type f -exec stat -f "%m %N" {} \; | sort -n | tail -1 | cut -f2- -d" "'
ltree() { tree -C $* | less -R }

showattr() {
  find . -xattr| while read filename
  do
    while read attr
    do
      echo "${filename} has attribute: ${attr}"
    done < <(xattr "${filename}")
  done
}

rmattr() {
  find . -xattr | while read filename
  do
    while read attr
    do
      echo "removing ${attr} from ${filename}"
      xattr -d "${attr}" "${filename}"
    done < <(xattr "${filename}")
  done
}

alias hs='split_tab'
alias vs='vsplit_tab'

function after() {
  $@
  /usr/local/bin/growlnotify Finished -m 'Done'
}

function randpass {
  openssl rand -base64 8 | shasum | cut -c 1-40 | tr -d "\r\n" | pbcopy;pbpaste
}

alias myip='curl -s ip.appspot.com | pbcopy;pbpaste'

alias flush_dns='sudo dscacheutil -flushcache'

alias hosts='st /etc/hosts'

alias nginxconf='st /usr/local/etc/nginx'
alias nginxsites='cd /usr/local/etc/nginx/sites-enabled'
alias nginxstart='sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginxstop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginxrestart='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist && sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginxreload='sudo kill -HUP `cat /usr/local/var/run/nginx.pid`'
alias nginxt='sudo /usr/local/bin/nginx -t'

alias phpconf='st /usr/local/etc/php/5.5'
alias phpstart='launchctl load -w /Users/achilles/Library/LaunchAgents/homebrew-php.josegonzalez.php55.plist'
alias phpstop='launchctl unload /Users/achilles/Library/LaunchAgents/homebrew-php.josegonzalez.php55.plist'
alias phprestart='launchctl unload /Users/achilles/Library/LaunchAgents/homebrew-php.josegonzalez.php55.plist && launchctl load -w /Users/achilles/Library/LaunchAgents/homebrew-php.josegonzalez.php55.plist'


alias mysqlstart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist'
alias mysqlstop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist'
alias mysqlrestart='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist'


export MARKPATH=$HOME/.marks

function jump {
  mark=$(head -n 1 "$MARKPATH/$1" 2>/dev/null)

  if [[ $mark != '' ]]; then
    cd $mark
  else
    echo "No such mark: $1"
  fi
}

function mark {
  mkdir -p "$MARKPATH"; echo "$(pwd)" > "$MARKPATH/$1"
}

function unmark {
  rm -i "$MARKPATH/$1"
}

function marks {
  find "$MARKPATH" -type f | while read filename
  do
    printf "%-12s -> %s\n" $(basename ${filename}) $(head -n 1 ${filename})
  done
}

alias j=jump

