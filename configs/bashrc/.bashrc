# 
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pac='sudo pacman -Syu'

BLACK="\[\e[30m\]"
BLUE="\[\e[34m\]"
CYAN="\[\e[36m\]"
GREEN="\[\e[32m\]"
MAGENTA="\[\e[35m\]"
RED="\[\e[31m\]"
WHITE="\[\e[37m\]"
YELLOW="\[\e[33m\]"

cat ~/.cache/wal/sequences

# PS1="${CYAN}\W ${GREEN}${WHITE} "

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# custom display of path
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[0;35m\]\u@\h\[\033[00m\] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
