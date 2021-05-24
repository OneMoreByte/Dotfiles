export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jsra"
ENABLE_CORRECTION="true"
ZSH_DISABLE_COMPFIX=true
plugins=(git sudo docker docker-compose brew yarn vi-mode)

math() { echo "$(( $* ))" }

alias vim=nvim

source ~/.iterm2_shell_integration.zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.profile
