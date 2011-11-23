#!/bin/sh
#
# Idea shamelessly stolen from joshua stein:
#  https://github.com/jcs/dotfiles/blob/master/move_in.sh
#
# Linux/Mac:
#  curl -L -o - https://github.com/z0mbix/dotfiles/raw/master/move_in.sh | bash
#
# FreeBSD/OpenBSD:
#  ftp -o - https://github.com/z0mbix/dotfiles/raw/master/move_in.sh | sh
#

GH_USER=z0mbix
URL=https://github.com/${GH_USER}/dotfiles/tarball/master
OS=`uname`
TD=`mktemp --tmpdir=/tmp -d XXXXXX`

if [ $OS = "Linux" -o $OS = "Darwin" ]; then
	FETCH="curl -L"
else
	FETCH="ftp -o -"
fi

$FETCH $URL | tar -C $TD -xzf - 

rm -f $TD/${GH_USER}-*/move_in.sh
cd $TD/${GH_USER}-* && tar -cf - . | (cd; tar -xvf -)
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
