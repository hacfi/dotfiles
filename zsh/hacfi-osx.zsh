# zsh plugins (2016-02): aws battery bower brew bundler common-aliases composer copydir copyfile docker docker-compose encode64 extract git git-extas github grunt history-substring-search httpie jsontools jump mosh node npm nvm osx postgres redis-cli rsync rvm sudo symfony2 vagrant
COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true
export COPY_EXTENDED_ATTRIBUTES_DISABLE COPYFILE_DISABLE

alias htop='sudo htop'
alias purge='sudo purge'

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

alias hosts='atom /etc/hosts'

alias nginxconf='atom /usr/local/etc/nginx'
alias nginxsites='cd /usr/local/etc/nginx/sites-enabled'
alias nginxreload='sudo kill -HUP `cat /usr/local/var/run/nginx.pid`'
alias nginxt='sudo /usr/local/bin/nginx -t'

alias phpconf='atom /usr/local/etc/php'

function reboot() {
  bash -c '/usr/bin/osascript -e "quit app \"Atom\"" &> /dev/null || true'
  sleep 2
  bash -c '/usr/bin/osascript -e "tell application \"Finder\" to restart" || true'
}

alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

tree_dirs(){
    dir=${1:-.}
    ls -R ${dir}| grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}

alias wifi='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

