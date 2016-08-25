# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-3

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

# use a colored prompt in vagrant
# Broken in vagrant & Cygwin
# see: https://github.com/mitchellh/vagrant/issues/6281
export VAGRANT_DETECTED_OS=cygwin

# Git shizzle
# Set editor for git to vim
# see: http://unix.stackexchange.com/questions/44336/im-not-getting-syntax-coloring-in-vim-using-cygwin
export VISUAL=vim
export EDITOR="$VISUAL"

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
