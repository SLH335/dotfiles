export EDITOR=nvim

# Clean home directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt SHARE_HISTORY


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
alias ..="cd .."

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias ls="lsd --group-dirs=first"
alias ll="ls -l"
alias la="ls -A"
alias lla="ls -lA"
alias tree="ls --tree"

alias lf="lfcd"

alias g="git"
alias gs="git status"
alias gl="git log"
alias gc="git commit -S"
alias gca="git commit -S --amend"
alias ga="git add"
alias ga.="git add ."
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"

alias cat="bat"

alias python="python3"
alias py="python3"

alias ping="prettyping --nolegend"

alias youtube-dl="yt-dlp"

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
