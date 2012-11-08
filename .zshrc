# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="z0mbix"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew ruby gem rvm ssh-agent vagrant)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Set Standard PATH
PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin

export GREP_OPTIONS="--color=auto"
export EDITOR=vim
export HISTSIZE=50000
export SAVEHIST=50000
export OS=`uname -s`
export UNISONLOCALHOSTNAME=`hostname -s`
export LESS="-niSRX"

# Home directory bin?
[ -d ~/bin ] && PATH=$PATH:~/bin

# Ruby gems?
[ -d ~/.gem/ruby/1.8/bin ] && PATH=$PATH:~/.gem/ruby/1.8/bin
[ -d /var/lib/gems/1.8/bin ] && PATH=$PATH:/var/lib/gems/1.8/bin
[ -d ~/.gem/ruby/1.9/bin ] && PATH=$PATH:~/.gem/ruby/1.9/bin
[ -d /var/lib/gems/1.9/bin ] && PATH=$PATH:/var/lib/gems/1.9/bin

# RVM?
[ -d ~/.rvm ] && source ~/.rvm/scripts/rvm

# /opt/local/{bin,sbin}?
[ -d /opt/local/bin ] && PATH=$PATH:/opt/local/bin:/opt/local/sbin

# Vagrant?
[ -d /opt/vagrant/bin ] && PATH=$PATH:/opt/vagrant/bin

# Suck up those aliases
[ -f ~/.zsh/aliases ] && source ~/.zsh/aliases

# Any private settings?
[ -f ~/.zsh/private ] && source ~/.zsh/private

# Import OS Specific stuff
[ -f ~/.zsh/$OS ] && source ~/.zsh/$OS

# Import functions
[ -f ~/.zsh/functions ] && source ~/.zsh/functions

# Output local TODO list if it exists
[ -f ~/.todo ] && (echo "** TODO LIST **"; cat ~/.todo)

autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

setopt completealiases
zstyle ':completion:*' menu select

setopt MENU_COMPLETE
setopt AUTO_MENU
setopt AUTO_LIST

# Disable autocorrect
unsetopt correct_all

export PATH
