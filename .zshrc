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

plugins=(git sudo docker vi-mode common-aliases)


alias vim=nvim

if [[ "$MACHINE_OS" == "mac" ]]; then
    source ~/.iterm2_shell_integration.zsh
fi

if [[ "$MACHINE_OS" == "linux" ]]; then
    export WLR_DRM_NO_MODIFIERS=1$
    export XDG_CURRENT_DESKTOP=sway$
fi

if [[ -f $HOME/.profile ]]; then
    source $HOME/.profile
fi
source $ZSH/oh-my-zsh.sh
