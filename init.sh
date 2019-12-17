#!/bin/bash

if [[ -f $HOME/.vimrc ]]; then
  mv $HOME/.vimrc $HOME/dotfiles/.vimrc.bak
fi

if [[ -L $HOME/.vimrc ]]; then 
  rm $HOME/.vimrc
fi

ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
