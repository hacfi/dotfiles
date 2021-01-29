#!/bin/sh

ln -sf $HOME/.dotfiles/zsh/hacfi.zsh $HOME/.oh-my-zsh/custom
ln -sf $HOME/.dotfiles/zsh/hacfi.zsh-theme $HOME/.oh-my-zsh/custom

unamestr=$(uname -s)

if [ X"$unamestr" = X'Darwin' ]; then
  ln -sf $HOME/.dotfiles/zsh/hacfi-osx.zsh $HOME/.oh-my-zsh/custom
elif [ X"$unamestr" = X'Linux' ]; then
  ln -sf $HOME/.dotfiles/zsh/hacfi-linux.zsh $HOME/.oh-my-zsh/custom
fi

mkdir -p $HOME/.oh-my-zsh/custom/plugins/jump
ln -sf $HOME/.dotfiles/zsh/jump.plugin.zsh $HOME/.oh-my-zsh/custom/plugins/jump
