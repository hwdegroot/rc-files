#!/bin/bash

if [[ -f ~/gittools/.gittoolsrc ]]; then
    export PRE_FETCH=1
    export POST_PULL=1
    export PRUNE_REMOTE=1
    export DEFAULT_BRANCH="master"
    export GITTOOLS=~/gittools
    source ~/gittools/.gittoolsrc
fi

[[ -z "$PLATFORMDIR" ]] && PLATFORMDIR=/cygdrive/c/source/platform
	if [[ -d $PLATFORMDIR ]]; then
	repodir() {
		PD=$PLATFORMDIR
		cd "$PD/$1"
	}
	
	alias pd=repodir
fi
alias my-ip="wget http://ipinfo.io/ip -qO -"

if [[ "$(which thefuck &>/dev/null || echo $?)" -ne 1 ]]; then
	eval $(thefuck --alias)
fi


ssh_proxy() {
  echo "Running ssh proxy @ port 1080"
  echo " - ssh -ND 1080 $1"
  ssh -ND 1080 $@ &
}

alias ssh-proxy='ssh_proxy'

