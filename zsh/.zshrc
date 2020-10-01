#auto-completion
autoload -U compinit && compinit

#history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#aliases
alias ls='ls --color=auto'

#Prompt
PS1='[%~] >> '

# zplug - zsh plugin manager
source /usr/share/zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"


# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

#tmux
## If not running interactively, do not do anything
#[[ $- != *i* ]] && return
## Otherwise start tmux
#[[ -z "$TMUX" ]] && exec tmux new -A -s main
