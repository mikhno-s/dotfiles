### ZSH CONFIGURATION
ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME="minimal"
UPDATE_ZSH_DAYS=7

plugins=(
  git 
  osx 
  docker
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

## COMPLETIONS
source <(kubectl completion zsh)
source <(helm completion zsh)
test -f "${HOME}/google-cloud-sdk/path.zsh.inc" && source "${HOME}/google-cloud-sdk/path.zsh.inc"
test -f "${HOME}/google-cloud-sdk/completion.zsh.inc" && source "${HOME}/google-cloud-sdk/completion.zsh.inc"
test -f "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -f $(which aws_zsh_completer.sh) 2>/dev/null && source $(which aws_zsh_completer.sh)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# KUBE_PS1_NS_ENABLE=false
# KUBE_PS1_SYMBOL_USE_IMG=true
# KUBE_PS1_PREFIX=''
# KUBE_PS1_SUFFIX=''
# KUBE_PS1_CTX_COLOR=yellow
# PS1='$(kube_ps1)'$PROMPT

PROMPT='%{$fg[yellow]%}[%D{%L:%M:%S.%.}]%{$reset_color%} '$PROMPT


# EXPORTS 
export EDITOR="vim"
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/.rvm/bin:$GOPATH/bin"
export JAVA_HOME="/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export NVM_DIR="$HOME/.nvm"
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
eval "$(direnv hook zsh)"

## ALIASES

alias k=kubectl
alias kgp='kubectl get pod'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias e='grep'
alias gssh="gcloud compute ssh"
alias lh='open /Users/serhiimi/Documents/work/lighthouse/index.html'
alias cc='docker run -it --rm --entrypoint clickhouse-client yandex/clickhouse-client --host host.docker.internal'
#export KUBECONFIG=/Users/serhiimi/.kube/config:/Users/serhiimi/Documents/le/leops/modules/aks_engine/_output/le-aks/kubeconfig/kubeconfig.westeurope.json
export KUBECONFIG=/Users/serhiimi/.kube/config
[ -f "/Users/serhiimi/.ghcup/env" ] && source "/Users/serhiimi/.ghcup/env" # ghcup-env
alias npmpublic="npm config set registry https://registry.npmjs.org/ && npm config get registry"
alias npmprivate="npm config set registry https://npm.dev.wixpress.com && npm config get registry"
export GPG_TTY=$(tty)
