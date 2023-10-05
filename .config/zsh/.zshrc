### XDG BASE DIRECTORIES
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR="nvim"

# ZSH options
export HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_SPACE
setopt autocd
bindkey -e

autoload -Uz compinit
zstyle ':completion:*' menu select cache-path $XDG_CACHE_HOME/zsh/zcompcache
zmodload zsh/complist
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Cleanup $HOME
export ANDROID_HOME="$XDG_DATA_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# Add to path
export PATH="$XDG_CONFIG_HOME/emacs/bin:$PATH"

# Source LFCD
LFCD="$XDG_CONFIG_HOME/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# Aliases
alias hx="helix"
alias vim="nvim"
alias vi="nvim"

alias lf="lfcd"

alias ls="lsd --group-dirs=first"
alias ll="ls -l"
alias la="ls -A"
alias lla="ls -lA"
alias tree="ls --tree"

alias cat="bat"

alias sxiv="nsxiv"

alias python="python3"
alias py="python3"

alias emacs="emacsclient -c -a 'emacs'"

alias src="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias shrc="vim $XDG_CONFIG_HOME/zsh/.zshrc"

alias ping="prettyping --nolegend"

alias tt="foot -F -o font='JetBrains Mono Nerd Font:size=25' tt -notheme"

# Set terminal window title
function precmd {
    print -Pn "\e]0;Terminal %(1j,%j job%(2j|s|); ,)%~\e\\"
}

# Set terminal process window title
function preexec {
    print -Pn "\e]0;${(q)1}\e\\"
}

# Color
alias ip="ip -c"
alias pacman="pacman --color=always"
alias paru="paru --color=always"

# Git for Dotfile Repo
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

# Starship Prompt
eval "$(starship init zsh)"

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
