#!/bin/sh
#
# Idea shamelessly stolen from joshua stein:
#  https://github.com/jcs/dotfiles/blob/master/move_in.sh
#
# Linux:
#  curl -L -o - https://github.com/z0mbix/dotfiles/raw/master/move_in.sh | bash
#
# FreeBSD/OpenBSD:
#  ftp -o - https://github.com/z0mbix/dotfiles/raw/master/move_in.sh | sh
#

URL=https://github.com/z0mbix/dotfiles/tarball/master
OS=`uname`
TD=`mktemp -d XXXXXX`

if [ ! -d ~/.ssh/ ]; then
	mkdir ~/.ssh/
	chmod 700 ~/.ssh
fi

if [ ! -f ~/.ssh/authorized_keys ]; then
	touch ~/.ssh/authorized_keys
	chmod 600 ~/.ssh/authorized_keys
fi

if [ $OS == "Linux" ]; then
	curl -L $URL | tar -C $TD -xzf - 
elif [ $OS == "OpenBSD" ] || [ $OS == "FreeBSD" ]; then
	ftp -o - $URL | tar -C $TD -xzf - 
else
	echo "Huh?"
fi

rm -f $TD/z0mbix-*/move_in.sh
mv -f $TD/z0mbix-*/.???* ~/
rm -rf $TD
