#!/bin/sh

# history
export ZDOTDIR=$HOME/.config/zsh
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$ZDOTDIR/.zsh_history"
setopt HIST_SAVE_NO_DUPS
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# vim bindings
bindkey -v

# beeping 
unsetopt BEEP

# completions
zmodload zsh/complist
zstyle ':completion:*' menu select matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit 
_comp_options+=(globdots)		# Include hidden files.

# show suggestions by pressing up/down key after what you already typed
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

#falso Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"

compinit

# Environment variables set everywhere
export EDITOR="nvim"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/achintyajha/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/achintyajha/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/achintyajha/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/achintyajha/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

