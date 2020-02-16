#auto-completion
autoload -U compinit && compinit

#aliases
alias ls='ls --color=auto'

#Prompt
PS1='[%~] >> '

#Variables
PATH="$PATH:$HOME/.local/bin"
export FZF_DEFAULT_COMMAND="rg --hidden --files ~/"
export EDITOR="emacs"
export BROWSER="firefox"
export MPD_HOST="127.0.0.1"
export MPD_PORT="6601"


#Binds
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

#History
SAVEHIST=1000
HISTFILE=~/.zsh_history
