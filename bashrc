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
	export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH" #needed to work opencv
	export PATH=$PATH:/usr/local/bin
	export WORKON_HOME=~/Envs

	alias ls='ls -hF'
fi

alias ll='ls -l'
alias la='ls -la'

source /usr/local/bin/virtualenvwrapper.sh

GITB="\`git branch 2>/dev/null | grep \"^\*\" | sed -E \"s/\*\ (.*)/\(\1\)/\"\`"
PS1="[\u@\h \W \[\033[31m\]$GITB\[\033[37m\]\[\033[00m\]]$ "

# PS1
export PS1

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Automatically activate Git projects' virtual environments based on the
# directory name of the project. Virtual environment name can be overridden
# by placing a .venv file in the project root with a virtualenv name in it
function workon_cwd {
    # Check that this is a Git repo
    GIT_DIR=`git rev-parse --git-dir 2> /dev/null`
    if [ $? == 0 ]; then
        # Find the repo root and check for virtualenv name override
        GIT_DIR=`\cd $GIT_DIR; pwd`
        PROJECT_ROOT=`dirname "$GIT_DIR"`
        ENV_NAME=`basename "$PROJECT_ROOT"`
        if [ -f "$PROJECT_ROOT/.venv" ]; then
            ENV_NAME=`cat "$PROJECT_ROOT/.venv"`
        fi
        # Activate the environment only if it is not already active
        if [ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]; then
            if [ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]; then
                workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
            fi
        fi
    elif [ $CD_VIRTUAL_ENV ]; then
        # We've just left the repo, deactivate the environment
        # Note: this only happens if the virtualenv was activated automatically
        deactivate && unset CD_VIRTUAL_ENV
    fi
}

# New cd function that does the virtualenv magic
function venv_cd {
    cd "$@" && workon_cwd
}

alias cd="venv_cd"

SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
	# spawn ssh-agent
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
	/usr/bin/ssh-add
}
				   
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		start_agent;
	}
else
	start_agent;
fi
