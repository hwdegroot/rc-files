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

