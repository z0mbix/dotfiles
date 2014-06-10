# ~/.bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global bash config file
[ -f /etc/bashrc ] && . /etc/bashrc

# Define Colours
export norm="\[\033[0m\]"
export black="\[\033[0;30m\]"
export dkgray="\[\033[1;30m\]"
export blue="\[\033[0;34m\]"
export lt_blue="\[\033[1;34m\]"
export green="\[\033[0;32m\]"
export lt_green="\[\033[1;32m\]"
export cyan="\[\033[0;36m\]"
export lt_cyan="\[\033[1;36m\]"
export red="\[\033[0;31m\]"
export lt_red="\[\033[1;31m\]"
export purple="\[\033[0;35m\]"
export lt_purple="\[\033[1;35m\]"
export brown="\[\033[0;33m\]"
export yellow="\[\033[1;33m\]"
export lt_gray="\[\033[0;37m\]"
export white="\[\033[1;37m\]"

# Color manpages?
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Some basic bash stuff
export TERM='xterm-color'
export EDITOR=vim
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '
export HISTFILESIZE=10000
export HISTSIZE=10000
export GREP_OPTIONS="--color=auto"
export LESS="-niSRX"
export OS=`uname -s`
export UNISONLOCALHOSTNAME=`hostname -s`
export GOPATH="$HOME/.go"

# Enable color support of ls and also add handy aliases
[ -x /usr/bin/dircolors ] && eval "`dircolors -b`"

# Set Standard PATH
PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Correct minor spelling errors in 'cd' commands.
shopt -s cdspell

# Don't try to find all the command possibilities when hitting TAB on an empty line.
shopt -s no_empty_cmd_completion

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Make ssh-agent work in tmux
if [ ! -z "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock" ] ; then
    unlink "$HOME/.ssh/agent_sock" 2>/dev/null
    ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
    export SSH_AUTH_SOCK="$HOME/.ssh/agent_sock"
fi

# Set badass prompt
case `hostname -s` in
    "murphy") HOSTCOLOUR=${red} ;;
    "shanks") HOSTCOLOUR=${yellow} ;;
    "eggers") HOSTCOLOUR=${blue} ;;
    "hesh")   HOSTCOLOUR=${blue} ;;
    "wrap")   HOSTCOLOUR=${lt_red} ;;
    "uk-dwooldridge2") HOSTCOLOUR=${lt_purple} ;;
    "Davids-MacBook-Pro") HOSTCOLOUR=${lt_purple} ;;
    *) HOSTCOLOUR=${yellow} ;;
esac

PROMPT_COMMAND='if [ $? -ne 0 ]; then ERROR_FLAG=1; else ERROR_FLAG=; fi; '
PS1=${lt_blue}'\u'${norm}'@'${HOSTCOLOUR}'\h '${norm}'['${green}'\@'${norm}'] '${yellow}'\w\n'${norm}'${ERROR_FLAG:+'${lt_red}'}\$${ERROR_FLAG:+'${norm}'} '

# Is hgprompt installed?
if [ -f ~/.hg_extensions/hgprompt/hgprompt.py ]; then
  hg_ps1() {
    hg prompt "({{branch}}{ at {bookmark}}{status}) " 2> /dev/null
  }
  PS1=${lt_blue}'\u'${norm}'@'${HOSTCOLOUR}'\h '${norm}'['${green}'\@'${norm}'] '${red}'$(hg_ps1)'${yellow}'\w\n'${norm}'${ERROR_FLAG:+'${lt_red}'}\$${ERROR_FLAG:+'${norm}'} '
fi


# Home directory bin?
[ -d ~/bin ] && PATH=$PATH:~/bin

# Ruby gems?
[ -d ~/.gem/ruby/1.8/bin ] && PATH=$PATH:~/.gem/ruby/1.8/bin
[ -d /var/lib/gems/1.8/bin ] && PATH=$PATH:/var/lib/gems/1.8/bin
[ -d ~/.gem/ruby/1.9/bin ] && PATH=$PATH:~/.gem/ruby/1.9/bin
[ -d /var/lib/gems/1.9/bin ] && PATH=$PATH:/var/lib/gems/1.9/bin

# Heroku Toolbelt?
[ -d /usr/local/heroku/bin ] && PATH=$PATH:/usr/local/heroku/bin

# RVM?
[ -f ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm

# chruby
[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ] && source /usr/local/opt/chruby/share/chruby/chruby.sh

# /opt/local/{bin,sbin}?
[ -d /opt/local/bin ] && PATH=$PATH:/opt/local/bin:/opt/local/sbin

# Omnibus Chef?
[ -d /opt/chef/bin ] && PATH=$PATH:/opt/chef/bin

# Suck up those aliases
[ -f ~/.bash/aliases ] && . ~/.bash/aliases

# Any private settings?
[ -f ~/.bash/private ] && . ~/.bash/private

# Import OS Specific stuff
[ -f ~/.bash/$OS ] && . ~/.bash/$OS

# Import functions
[ -f ~/.bash/functions ] && . ~/.bash/functions

# Output local TODO list if it exists
[ -f ~/.todo ] && (echo "** TODO LIST **"; cat ~/.todo)

# Additional completions
[ -f ~/.bash/completions ] && . ~/.bash/completions

# Enable command/file completion with sudo
complete -f -c sudo

# Export important envirnoment variables
export TERM PATH PROMPT_COMMAND PROMPT_TIME PS1
