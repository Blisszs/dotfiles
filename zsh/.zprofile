#default programs
export EDITOR="emacs"
export BROWSER="firefox"
export READER="zathura"
export TERMINAL="alacritty"

#Variables
PATH="$PATH:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export FZF_DEFAULT_COMMAND="rg --hidden --files ~/"
export MPD_HOST="127.0.0.1"
export MPD_PORT="6601"

export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export INFOPATH="/usr/share/info"


# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx
