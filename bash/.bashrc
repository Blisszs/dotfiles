# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sudo='doas'
PS1='[\u@\h \W]\$ '

HISTSIZE=1000
HISTFILESIZE=1000
