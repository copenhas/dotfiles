source $HOME/.bash/*.bash

export PATH=$HOME/bin:$PATH
export SVN_EDITOR=/usr/bin/vim
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1


if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion 
fi


##
# Your previous /Users/seancopenhaver/.bash_profile file was backed up as /Users/seancopenhaver/.bash_profile.macports-saved_2009-09-27_at_22:07:37
##

# MacPorts Installer addition on 2009-09-27_at_22:07:37: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm 1.8.7
