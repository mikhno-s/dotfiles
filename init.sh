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

bi() {
    brew install $@
}

test -d $HOME/dotfiles || git clone git@github.com:mikhno-s/dotfiles.git $HOME/dotfiles
git -C $HOME/dotfiles pull
# Installing brew
brew list || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#Installing brew packages
bi "wget" "git" "kubectl" "helm" "azure-cli" "coreutils" "direnv" "Azure/aks-engine/aks-engine" "ipcalc" "jq" \
   "kube-ps1" "htop" "kubectx" "ncdu" "nmap" "nvm" "packer" "python" "telnet" "terraform" "watch" \
   "terraform" "awscli"
brew cask install google-cloud-sdk


if ! xcode-select -p ; then
    xcode-select --install
fi 
  
# Installing oh-my-zsh
test -d $ZSH || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing powerline fonts
if test -d $ZSH; then
    cd ~/.oh-my-zsh 
    git clone https://github.com/powerline/fonts.git
    cd fonts && ./install.sh
fi



# Installing zsh plugings
test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

create_link ".zshrc"
create_link Library/Application\ Support/iTerm2/DynamicProfiles/iterm_profiles.json

create_link ".vimrc"
if [[ ! -f $HOME/.vim/colors ]]; then
    mkdir -p $HOME/.vim/colors
fi
create_link ".vim/colors/molokai.vim"
create_link ".gitignore"
create_link ".ssh/config"
create_link ".gitconfig"
create_link Library/Application\ Support/Code/User/settings.json #VSCode
