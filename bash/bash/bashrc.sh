# set terminal emulator tab bar title
set_title() {
    echo -ne "\033]0;${*}\007"
}

# TERM
export TERM=xterm-256color

# disable ctrl+d to exit
set -o ignoreeof

# alias
alias k=kubectl
alias ls='ls --color'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias grep='grep --color'
alias hs='history | grep'
alias hsi='history | grep -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias dcoker=docker

# set center machine PS1
_idc=$(echo $PS1 | grep -P -o '\([A-z-]+:idc[0-9]+\)' 2> /dev/null)
if [ -n "$_idc" ]; then
    _idc=${_idc#(}
    _idc=${_idc%)}
    export PS1="\[\e[92m\]\u\[\e[0m\]\[\e[93m\]@\[\e[0m\]\[\e[94m\]\h\[\e[0m\](\[\e[36m\]\[\e[1m\]center:${_idc}\[\e[0m\]\[\e[0m\]):\[\e[94m\]\w\[\e[0m\]\$ "
    set_title $_idc
fi
