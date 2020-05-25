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
