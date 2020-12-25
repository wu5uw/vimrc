# .bashrc

# User specific aliases and functions

alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

export ANT_HOME=/usr/share/ant/
