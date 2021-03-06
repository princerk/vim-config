#!/bin/sh
set -e

if [ -e $HOME/.vimrc ] || [ -e $HOME/.vim ]; then
  echo "Error: ~/.vimrc or ~/.vim already exists."
  echo "Move them and then try again."
  exit 1
fi

echo === Installing Vim config files
echo === Checking out vundle
git submodule update --init

echo === Linking vim directories
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD $HOME/.vim

echo === Vundling
vim +PluginInstall +qall

echo === Done
