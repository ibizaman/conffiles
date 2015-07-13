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
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


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

########################
# Process Notification #
########################
setopt notify

