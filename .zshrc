export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim

case "$(uname -s)" in
   Darwin)
     MACHINE_OS="mac"
     ;;

   Linux)
     MACHINE_OS="linux"
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     MACHINE_OS="windows"
     ;;

   *)
     MACHINE_OS="unknown" 
     ;;
esac


ZSH_THEME="jsra"
ENABLE_CORRECTION="true"
ZSH_DISABLE_COMPFIX=true

plugins=(git sudo vi-mode common-aliases)


alias vim=nvim

if [[ "$MACHINE_OS" == "linux" ]]; then


fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

if [[ -f $HOME/.profile ]]; then
    source $HOME/.profile
fi

alias ssh='TERM=xterm-256color ssh'

source $ZSH/oh-my-zsh.sh
