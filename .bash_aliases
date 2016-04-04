#!/bin/bash

if [[ -f ~/gittools/.gittoolsrc ]]; then
    export PRE_FETCH=1
    export POST_PULL=1
    export PRUNE_REMOTE=1
    export DEFAULT_BRANCH="master"
    export GITTOOLS=~/gittools
    source ~/gittools/.gittoolsrc
fi

if [[ -f ~/tools/.toolsrc ]]; then
    [[ -z "$PLATFORM" ]] && export PLATFORM=/cygdrive/c/source/platform/
    export VSTOOLS=~/tools
    source ~/tools/.toolsrc
    alias git-filemode=~/tools/git-filemode.sh
fi

# vagrant 
alias vssh="vagrant ssh"
alias vdestroy="vagrant destroy --force"
alias vup="vagrant up"
alias tmux="tmux -2"
alias winhome="cd /cygdrive/c/Users/rgr"

#alias vs="/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv.exe &"
function vs() { 
  eval "/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv.exe $* & disown" 
}
