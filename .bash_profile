source $HOME/.bash/*.bash

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/Cellar/python/2.7.1/bin
export SVN_EDITOR=/usr/bin/vim
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm 1.9.2

export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH

. ~/.nvm/nvm.sh
nvm use default 

