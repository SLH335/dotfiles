export EDITOR=nvim

# XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt SHARE_HISTORY
setopt autocd

# Clean home directory
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

# Add GOPATH to path
export PATH="$GOPATH/bin:$PATH"

# Aliases
aliases_file="$XDG_CONFIG_HOME/sh/aliases.sh"
if [ -f "$aliases_file" ]; then
    source "$aliases_file"
fi

# Set terminal window title
function precmd {
    print -Pn "\e]0;Terminal %(1j,%j job%(2j|s|); ,)%~\e\\"
}

# Set terminal process window title
function preexec {
    print -Pn "\e]0;${(q)1}\e\\"
}

# Aliases for color
alias ip="ip -c"
alias grep='grep --color=auto'

# Source lfcd
LFCD="$XDG_CONFIG_HOME/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# Starship Prompt
eval "$(starship init zsh)"

eval "$(zoxide init zsh --cmd cd)"


### ZSH PLUGINS ###

# syntax highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
# autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
# better vi mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
