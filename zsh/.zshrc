#auto-completion
autoload -U compinit && compinit

#history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#aliases
alias ls='ls --color=auto'

#Prompt
PS1='[%n@%m] [%~] >> '

# functions

gen_html() {
	pandoc -f markdown -t html $1 | cat _header.html - _footer.html > "$(echo "$1" | sed 's/.md/.html/')"
}
