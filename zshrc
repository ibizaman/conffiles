#!/bin/zsh

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit
prompt walters

autoload -Uz colors
colors

export VISUAL="vim"

# No beep
unsetopt beep

# Emacs key-bindings
bindkey -e


##############
# Completion #
##############
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true  # auto rehash
setopt completealiases


###########
# History #
###########
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
SAVEHIST=100000
HISTFILE=~/.zsh_history
HISTSIZE=10000

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward


################################
# Remember visited directories #
################################
# dirs -v
# cd -<NUM>

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
[[ -f $DIRSTACKFILE ]] || mkdir -p "$HOME/.cache/zsh"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi

chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus


#######################
# Syntax Highlighting #
#######################
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


## Man with colors
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}


##################
# History Search #
##################
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


########################
# Process Notification #
########################
setopt notify


###########
# ALIASES #
###########

function sshtmux() {
    ssh -t $1 -- tmux attach || tmux new
}
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -d ~/.zsh_aliases ]; then
    source ~/.zsh_aliases/*
fi


#######
# SSH #
#######

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-vars
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-vars)" >/dev/null
fi


########
# PATH #
########

export PATH="$HOME/bin:$PATH"
export EDITOR="$HOME/.vim/emacsnw"


#####################
# VIRTUALENVWRAPPER #
#####################

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/bin/virtualenvwrapper.sh


####################
# AUTOCOMPLETE ssh #
####################
# https://serverfault.com/a/170481/221894

h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi
