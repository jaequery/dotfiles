# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

#export ZSH_THEME="afowler"
export ZSH_THEME="sunrise"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# load ohmyzsh
source $ZSH/oh-my-zsh.sh

# disable auto correct
unsetopt correct_all
unsetopt correct

# set paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/share/npm/lib/node_modules:/usr/local/share/npm/bin/:$PATH"

# alias
alias show_open_ports='lsof -i -P|grep LISTEN'
alias l='ls'
alias ll='ls -lnha'


