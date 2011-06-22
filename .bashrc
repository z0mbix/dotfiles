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
# Set 256 colour terminal for Ubuntu / Redhat
if [ -e /lib/terminfo/x/xterm-256color ] || [ -e /usr/share/terminfo/x/xterm-256-color ]; then
	TERM='xterm-256color'
else
	TERM='xterm-color'
fi

export EDITOR=vim
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '
export HISTFILESIZE=10000
export HISTSIZE=10000
export GREP_OPTIONS="--color=auto"
export OS=`uname -s`

# Set Standard PATH/CDPATH
PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin

if [ $OS == 'OpenBSD' ]; then
	export CVS_RSH=ssh
	export CVSROOT=anoncvs@anoncvs.de.openbsd.org:/cvs
	export PKG_PATH=ftp://ftp.openbsd.org/pub/OpenBSD/`uname -r`/packages/`machine -a`
elif [ $OS == 'FreeBSD' ]; then
	export ARCH=`uname -m`
	export VER=`uname -r|tr 'A-Z' 'a-z'`
	export PACKAGESITE=ftp://ftp.uk.freebsd.org/pub/FreeBSD/ports/$ARCH/packages-${VER}-release/Latest/
	if [ pkg_info | grep pkgsearch >/dev/null ]; then
		[ -f ~/.portindex.txt ] || pkgsearch -u
	else
		echo "pkgsearch not installed!"
	fi
elif [ $OS == 'NetBSD' ]; then
	PATH=$PATH:/usr/pkg/bin:/usr/pkg/sbin:/usr/X11R7/bin:/usr/X11R6/bin
	export CVSROOT="anoncvs@anoncvs.be.NetBSD.org:/cvsroot"
	export ARCH=`uname -m`
	export VER=`uname -r`
	export PKGSRC_VER="2010Q4"
	export PKG_PATH="ftp://ftp2.fr.netbsd.org/pub/pkgsrc/packages/$OS/$ARCH/${VER}_${PKGSRC_VER}/All"
	export PASSIVE_FTP=yes
	export MANPATH=$MANPATH:/usr/share/man:/usr/pkg/man
elif [ $OS == 'Darwin' ]; then
	[ -d /Developer/usr/bin ] && PATH=$PATH:/Developer/usr/bin
fi

# Ruby gems?
[ -d ~/.gem/ruby/1.8/bin ] && PATH=$PATH:~/.gem/ruby/1.8/bin
[ -d /var/lib/gems/1.8/bin ] && PATH=$PATH:/var/lib/gems/1.8/bin

# Is this there?
[ -d /opt/local/bin ] && PATH=$PATH:/opt/local/bin:/opt/local/sbin

# Is Dropbox installed?
[ -d ~/Dropbox ] && PATH=$PATH:~/Dropbox/bin:~/Dropbox/Code/Shell

#append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Correct minor spelling errors in 'cd' commands.
shopt -s cdspell

# Don't try to find all the command possibilities when hitting TAB on an empty line.
shopt -s no_empty_cmd_completion

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set badass prompt
case `hostname -s` in
    "murphy") HOSTCOLOUR=${red} ;;
    "shanks") HOSTCOLOUR=${yellow} ;;
    "eggers") HOSTCOLOUR=${blue} ;;
    "wrap")   HOSTCOLOUR=${lt_red} ;;
    "uk-dwooldridge2") HOSTCOLOUR=${lt_purple} ;;
    *) HOSTCOLOUR=${yellow} ;;
esac

PROMPT_COMMAND='if [ $? -ne 0 ]; then ERROR_FLAG=1; else ERROR_FLAG=; fi; '
PS1=${lt_blue}'\u'${norm}'@'${HOSTCOLOUR}'\h '${norm}'['${green}'\@'${norm}'] '${yellow}'\w\n'${norm}'${ERROR_FLAG:+'${lt_red}'}\$${ERROR_FLAG:+'${norm}'} '

# Suck up those aliases
[ -f ~/.bash/aliases ] && . ~/.bash/aliases
[ -f ~/.bash/private ] && . ~/.bash/private

# Bash tab completion (Linux/Mac)
[ -f /etc/bash_completion ] && . /etc/bash_completion

# Bash tab completion (FreeBSD/Mac Homebrew)
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Additional completions
[ -f ~/.bash/completions ] && . ~/.bash/completions

# Enable command/file completion with sudo
complete -f -c sudo

# Export important envirnoment variables
export TERM PATH PROMPT_COMMAND PROMPT_TIME PS1
