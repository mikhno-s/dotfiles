#!/bin/bash


test -d $HOME/dotfiles || git clone git@github.com:mikhno-s/dotfiles.git $HOME/dotfiles
git -C $HOME/dotfiles pull

# TODO sync iterm setting and fonts

# TODO sync oh-my-zsh settings 

# Installing zsh plugings
test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

create_link() {
  if [[ -L $HOME/$1 ]]; then 
    rm $HOME/$1
  fi

  if [[ -f $HOME/$1 ]]; then
    mv $HOME/$1 $HOME/dotfiles/$1.bak
  fi

  ln -s $HOME/dotfiles/$1 $HOME/$1
}

create_link ".vimrc"
create_link ".zshrc"