#!/bin/sh

brew install \
    git \
    htop-osx \
    icu4c \
    imagemagick \
    logstash \
    mcrypt \
    mobile-shell \
    mtr \
    node \
    pcre \
    pidof \
    screenresolution \
    rdiff-backup \
    rename \
    tmux \
    tree \
    unrar \
    wget \
    youtube-dl \
    zsh \
    zsh-completions \
    zsh-history-substring-search \
    zsh-syntax-highlighting

# htop-osx
sudo chown root:wheel /usr/local/Cellar/htop-osx/*/bin/htop
sudo chmod u+s /usr/local/Cellar/htop-osx/*/bin/htop

# mtr
sudo chown root:wheel /usr/local/Cellar/mtr/*/sbin/mtr
sudo chmod u+s /usr/local/Cellar/mtr/*/sbin/mtr

# brew install \ 
#     percona-server \
#     redis