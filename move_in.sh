#!/bin/sh
#
# Idea shamelessly stolen from joshua stein:
#  https://github.com/jcs/dotfiles/blob/master/move_in.sh
#
# Linux/Mac/FreeBSD:
#  curl -L -o - https://github.com/z0mbix/dotfiles/raw/master/move_in.sh | bash
#
# OpenBSD:
#  ftp -o - https://github.com/z0mbix/dotfiles/raw/master/move_in.sh | sh
#

GH_USER=z0mbix
URL=https://github.com/${GH_USER}/dotfiles/tarball/master
OS=`uname`
TD=`mktemp -d XXXXXX`
TAR=tar
FETCH="curl -L"

# OS Specific Stuff
[ $OS = "OpenBSD" ] && FETCH="ftp -o -"
[ $OS = "SunOS" ] && TAR='gtar'

$FETCH $URL | $TAR -C $TD -xzf - 

rm -f $TD/${GH_USER}-*/{README,move_in.sh}
cd $TD/${GH_USER}-* && $TAR -cf - . | (cd; tar -xvf -)
cd -
rm -rf $TD

if [ ! -d ~/.ssh/ ]; then
	mkdir ~/.ssh/
	chmod 700 ~/.ssh
fi

if [ ! -f ~/.ssh/authorized_keys ]; then
	touch ~/.ssh/authorized_keys
	chmod 600 ~/.ssh/authorized_keys
fi

if [ $OS == "OpenBSD" ]; then
	if [ -f ~/.profile ]; then
		mv ~/.profile ~/.profile.orig
	fi
	mv ~/.profile-openbsd ~/.profile
	rm -f .cshrc .login .mailrc
fi

# Fluxbox on OS X? 
if [ $OS = "Darwin" ]; then
	rm -rf ~/.fluxbox
fi
