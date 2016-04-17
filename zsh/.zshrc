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

# load docker socket
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_CERT_PATH=/Users/jaequery/.docker/machine/machines/default
export DOCKER_TLS_VERIFY=1

# load nvm
export NVM_DIR="/Users/jaequery/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# load rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# updated cacert
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cacert.pem

# alias
alias show_open_ports='lsof -i -P|grep LISTEN'
alias l='ls'
alias ll='ls -lnha'


