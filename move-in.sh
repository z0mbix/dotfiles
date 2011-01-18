#!/bin/sh
#
# Shamelessly stolen from joshua stein:
# https://github.com/jcs/dotfiles/blob/master/move_in.sh
#

if [ ! -d ~/.ssh/ ]; then
	mkdir ~/.ssh/
	chmod 700 ~/.ssh
fi

TD=`mktemp -d XXXXXX`

curl -L https://github.com/z0mbix/dotfiles/tarball/master | tar -C $TD -xvzf - 
rm -f $TD/z0mbix-*/move-in.sh
mv -f $TD/z0mbix-*/.???* /tmp/test/
rm -rf $TD
