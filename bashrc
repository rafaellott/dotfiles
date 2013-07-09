#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export the GOPATH
export GOPATH="$HOME/go"

# make vim default editor
export EDITOR="vim"

# some exports and alias are differente from my Desktop
# and my mac
if [[ $(uname) == 'Linux' ]]; then
	alias ls='ls -hF --color=auto'
elif [[ $(uname) == 'Darwin' ]]; then
	export CLICOLOR=1
	alias ls='ls -hF'
fi

GITB="\`git branch 2>/dev/null | grep \"^\*\" | sed -E \"s/\*\ (.*)/\(\1\)/\"\`"
PS1="[\u@\h \W \[\033[31m\]$GITB\[\033[37m\]\[\033[00m\]]$ "

# PS1
export PS1
