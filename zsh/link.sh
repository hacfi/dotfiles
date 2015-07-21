#!/bin/sh

ln -s $HOME/.dotfiles/zsh/hacfi.zsh $HOME/.oh-my-zsh/custom
ln -s $HOME/.dotfiles/zsh/hacfi.zsh-theme $HOME/.oh-my-zsh/custom

unamestr=$(uname -s)

if [ X"$unamestr" = X'Darwin' ]; then
  ln -s $HOME/.dotfiles/zsh/hacfi-osx.zsh $HOME/.oh-my-zsh/custom
elif [ X"$unamestr" = X'Linux' ]; then
  ln -s $HOME/.dotfiles/zsh/hacfi-linux.zsh $HOME/.oh-my-zsh/custom
fi

mkdir -p $HOME/.oh-my-zsh/custom/plugins/jump
ln -s $HOME/.dotfiles/zsh/jump.plugin.zsh $HOME/.oh-my-zsh/custom/plugins/jump
