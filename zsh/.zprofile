#default programs
export EDITOR="emacs"
export BROWSER="firefox"
export READER="zathura"
export TERMINAL="alacritty"

#xdg dir variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#Variables
export FZF_DEFAULT_COMMAND="rg --hidden --files ~/"
export MPD_HOST="127.0.0.1"
export MPD_PORT="6601"

#config dirs
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
