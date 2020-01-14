#!/bin/bash

create_link() {
    if [[ -L $HOME/"${1}" ]]; then 
        rm $HOME/"${1}"
    fi

    if [[ -f $HOME/"${1}" ]]; then
        mv $HOME/"${1}" $HOME/dotfiles/"${1}".bak
    fi

    ln -s $HOME/dotfiles/"${1}" $HOME/"${1}"
}

test -d $HOME/dotfiles || git clone git@github.com:mikhno-s/dotfiles.git $HOME/dotfiles
git -C $HOME/dotfiles pull


if [[ "$OSTYPE" == "linux-gnu" ]]; then 
    echo This is linix
fi

if [[ "$OSTYPE" == "darwin"* ]]; then

    if ! xcode-select -p ; then
        xcode-select --install
    fi 
  
    # Installing zsh plugings
    test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    create_link ".zshrc"
    create_link Library/Application\ Support/iTerm2/DynamicProfiles/iterm_profiles.json

fi

create_link ".vimrc"
if [[ ! -f $HOME/.vim/colors ]]; then
    mkdir $HOME/.vim/colors
fi
create_link ".vim/colors/molokai.vim"
create_link ".gitignore"
create_link ".ssh/config"
create_link ".gitconfig"
