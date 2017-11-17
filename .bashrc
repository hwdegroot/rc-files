# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=500000
HISTIGNORE="&:[ ]*:exit"


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00;37m\]@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\] \[\033[01;33m\]\$\[\033[00m\] '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w \$ '
fi
unset color_prompt force_color_prompt
# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# source rvm file
if [[ -f /etc/profile.d/rvm.sh ]]; then
  source /etc/profile.d/rvm.sh
fi

# sensible bash
# https://github.com/mrzool/bash-sensible
if [[ -f $HOME/.config/sensible.bash/sensible.bash ]]; then
  source $HOME/.config/sensible.bash/sensible.bash
fi

[[ -f ~/.config/bash-git-prompt/config ]] && source ~/.config/bash-git-prompt/config
[[ -f ~/bash-git-prompt/gitprompt.sh ]] && source ~/bash-git-prompt/gitprompt.sh
[[ -f ~/.gitrc ]] && source ~/.gitrc

if [ -n "$DISPLAY" ]; then
  xset b off
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
  source /etc/bash_completion
fi
if [[ -f $HOME/.bash_completion ]] && ! shopt -oq posix; then
  source $HOME/.bash_completion
fi

sudo chmod 0666 /sys/class/backlight/intel_backlight/brightness


if [[ -f $HOME/bash-insulter/src/bash.command-not-found ]]; then
  source $HOME/bash-insulter/src/bash.command-not-found
fi

############################################################################
###                                                                      ###
##                            PATH VARIABLES                              ##
###                                                                      ###
############################################################################
# Rust Cargo dir
export PATH="$HOME/.cargo/bin:$PATH"

# Docker Hub
export DOCKER_HUB_USERNAME="hwdegroot"

# NVM Home dir
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Minikube
#which minikube >/dev/null && eval $(minikube docker-env)

# Default docker run options
export DOCKER_RUN_OPTS="-it -v `pwd`:`pwd` -w `pwd` -u `id -u`:`id -g`"

# RVM stuff
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export GEM_HOME=$HOME/.rvm/rubies/default/gems
export GEM_PATH=$GEM_HOME
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH=$GEM_HOME/bin:$HOME/.rvm/rubies/default/bin:$PATH

# laravel
export PATH=$PATH:/home/rik/.composer/vendor/bin

if [[ -d /usr/local/go/bin ]]; then
  export GOPATH=$HOME/Go
  export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
  mkdir -p $GOPATH
fi

export PATH="$HOME/.cargo/bin:$PATH"
export PLATFORMDIR=~/source
if [[ -d $PLATFORMDIR/visualphpunit/bin ]]; then
  export PATH=$PATH:${PLATFORMDIR}/visualphpunit/bin
fi

export IPADDR=`ip addr show wlp2s0 | grep -Po "(?<=inet )[0-9]+(\.[0-9]+){3}"`
