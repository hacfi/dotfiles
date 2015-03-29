COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true
export COPY_EXTENDED_ATTRIBUTES_DISABLE COPYFILE_DISABLE

alias lastmod='find . -type f -exec stat -f "%m %N" {} \; | sort -n | tail -1 | cut -f2- -d" "'
ltree() { tree -aCF --dirsfirst $* | less -R }

showattr() {
  find . -xattr | while read filename
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
      echo "removing attr ${attr} from ${filename}"
      xattr -d -s "${attr}" "${filename}"
    done < <(xattr -s "${filename}")
  done
}

rmqua() {
  find . -xattrname com.apple.quarantine | while read filename
  do
    echo "removing attr com.apple.quarantine from ${filename}"
    xattr -d -s com.apple.quarantine "${filename}"
  done
}

alias sr=screenresolution

alias hs='split_tab'
alias vs='vsplit_tab'

function after() {
  $@
  /usr/local/bin/growlnotify Finished -m 'Done'
}

function rand {
  openssl rand -base64 8 | shasum | cut -c 1-16 | tr -d "\r\n" | pbcopy;pbpaste
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

alias phpconf='st /usr/local/etc/php'
alias phpstart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php55.plist'
alias phpstop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php55.plist'
alias phprestart='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php55.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php55.plist'
alias php56start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist'
alias php56stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php56.plist'
alias php56restart='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php56.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist'

alias mysqlstart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist'
alias mysqlstop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist'
alias mysqlrestart='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist'


