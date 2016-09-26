#!/bin/bash

if [[ -f ~/gittools/.gittoolsrc ]]; then
  export PRE_FETCH=1
  export POST_PULL=1
  export PRUNE_REMOTE=1
  export DEFAULT_BRANCH="master"
  export GITTOOLS=~/gittools
  source ~/gittools/.gittoolsrc
fi

[[ -z "$PLATFORMDIR" ]] && PLATFORMDIR=~/source/platform
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

alias logoff='pkill -KILL -u $USER'

which virtualenvwrapper.sh &>/dev/null
if [[ $? -eq 0 ]];then 
  source $(which virtualenvwrapper.sh)
  export WORKON_HOME=$HOME/.virtualenvs
  # virtualenv aliases
  # http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
  alias v='workon'
  alias v.deactivate='deactivate'
  alias v.mk='mkvirtualenv --no-site-packages'
  alias v.mk_withsitepackages='mkvirtualenv'
  alias v.rm='rmvirtualenv'
  alias v.switch='workon'
  alias v.add2virtualenv='add2virtualenv'
  alias v.cdsitepackages='cdsitepackages'
  alias v.cd='cdvirtualenv'
  alias v.lssitepackages='lssitepackages'
fi

complete -C cf_completion cf

ssh_proxy() {
  args=()
  port=1080
  if [[ $# -eq 0 ]]; then
    echo "ssh-proxy [-p <port>] user@server [-i identityfile]"
    return 1
  fi
  while [ $# -gt 0 ]; do
    case $1 in
      -p|--port)
        shift
        port=$1
        ;;
      *) args+=("$1")
    esac
    shift
    echo ${args[@]}
  done
  set -- ${args[@]}
  echo "Running ssh proxy @ port 1080"
  echo " - ssh -ND $port $@"
  ssh -ND $port $@ &
  echo $! > .ssh-proxy.$!.pid
}

alias ssh-proxy='ssh_proxy'


