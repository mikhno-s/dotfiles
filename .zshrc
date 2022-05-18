# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ZSH CONFIGURATION

ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
UPDATE_ZSH_DAYS=7

plugins=(
  git 
  macos 
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

## COMPLETIONS
source <(kubectl completion zsh)
test -f "${HOME}/google-cloud-sdk/path.zsh.inc" && source "${HOME}/google-cloud-sdk/path.zsh.inc"
test -f "${HOME}/google-cloud-sdk/completion.zsh.inc" && source "${HOME}/google-cloud-sdk/completion.zsh.inc"
test -f "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -f $(which aws_zsh_completer.sh) 2>/dev/null && source $(which aws_zsh_completer.sh)


# EXPORTS 
export EDITOR="vim"
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/.rvm/bin:$GOPATH/bin"
export JAVA_HOME="/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export NVM_DIR="$HOME/.nvm"
export KUBECONFIG=/Users/$USER/.kube/config
export GPG_TTY=$TTY
eval "$(direnv hook zsh)"

## ALIASES

alias k=kubectl
alias kgp='kubectl get pod'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias e='grep'
alias gssh="gcloud compute ssh"
alias npmpublic="npm config set registry https://registry.npmjs.org/ && npm config get registry"
alias npmprivate="npm config set registry https://npm.dev.wixpress.com && npm config get registry"
alias nvm_init='[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"' # This loads nvm
alias rvm_init='[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' # Load RVM into a shell session *as a function*

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

