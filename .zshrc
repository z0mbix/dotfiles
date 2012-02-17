# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="z0mbix"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew ruby rvm)

source $ZSH/oh-my-zsh.sh

# Set Standard PATH
PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin

# Home directory bin?
[ -d ~/bin ] && PATH=$PATH:~/bin

# Ruby gems?
[ -d ~/.gem/ruby/1.8/bin ] && PATH=$PATH:~/.gem/ruby/1.8/bin
[ -d /var/lib/gems/1.8/bin ] && PATH=$PATH:/var/lib/gems/1.8/bin
[ -d ~/.gem/ruby/1.9/bin ] && PATH=$PATH:~/.gem/ruby/1.9/bin
[ -d /var/lib/gems/1.9/bin ] && PATH=$PATH:/var/lib/gems/1.9/bin

# RVM?
if [ -d ~/.rvm ]; then
  echo "RVM Installed!"
#  PATH=$PATH:~/.rvm/bin
#  PATH=$PATH:~/.rvm/gems/ruby-1.9.2-p290/bin:~/.rvm/gems/ruby-1.9.2-p290@global/bin:~/.rvm/rubies/ruby-1.9.2-p290/bin
  source ~/.rvm/scripts/rvm
fi

# /opt/local/{bin,sbin}?
[ -d /opt/local/bin ] && PATH=$PATH:/opt/local/bin:/opt/local/sbin

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

# Customize to your needs...
#export PATH=/Users/zombie/.rvm/gems/ruby-1.9.2-p290/bin:/Users/zombie/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/zombie/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/zombie/.rvm/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/Users/zombie/bin:/Developer/usr/bin:/Users/zombie/Dropbox/bin:/Users/zombie/Dropbox/Code/Shell
export PATH
