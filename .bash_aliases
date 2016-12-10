#!/bin/bash

if [[ -f ~/gittools/.gittoolsrc ]]; then
  export PRE_FETCH=1
  export POST_PULL=1
  export PRUNE_REMOTE=1
  export DEFAULT_BRANCH="master"
  export GITTOOLS=~/gittools
  source ~/gittools/.gittoolsrc
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

# docker aliases
alias docker-remove-images='docker images -qa | xargs -i docker rmi -f {}'
alias docker-remove-containers='docker ps -qa | xargs -i docker rm -f {}'
alias docker-remove-volumes='docker volume ls -q | xargs -i docker volume rm {}'
# git aliases
alias gp='git push'
alias g!='git add . && git commit --amend && git push --force'
alias gm='git commit -am '
alias gc='git clean -fdx && git reset --hard'
alias c='clear'
alias gp='git push'
alias gl='git log'
alias clone="git clone"
alias co="git checkout"
alias gb='git branch'
alias pull="git pull"

gam() {
  git add ${@:1:$#-1} && git commit -m "${@:$#-1:1}"
}
alias ga=gam

aa_256 ()
{
  local o= i= x=`tput op` cols=`tput cols` y= oo= yy=;
  y=`printf %$(($cols-6))s`;
  yy=${y// /=};
  for i in {0..256};
  do
    o=00${i};
    oo=`echo -en "setaf ${i}\nsetab ${i}\n"|tput -S`;
    echo -e "${o:${#o}-3:3} ${oo}${yy}${x}";
  done
}
alias colors=aa_256


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

alias apt-upgrade='sudo apt-get upgrade -y && sudo apt autoremove -y'
