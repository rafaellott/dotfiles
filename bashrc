#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GOPATH=~/go

alias ls='ls -hF --color=auto'
PS1='[\u@\h \W]\$ '
