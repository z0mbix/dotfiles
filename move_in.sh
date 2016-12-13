#!/usr/bin/env bash
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

gh_user=z0mbix
url=https://github.com/${gh_user}/dotfiles/tarball/master
os=`uname`
td=`mktemp -d XXXXXX`
tar=tar
fetch="curl -s -L"

# OS Specific Stuff
[ $os = "OpenBSD" ] && fetch="ftp -o -"
[ $os = "SunOS" ] && tar='gtar'

$fetch $url | $tar -C $td -xzf -

rm -f $td/${gh_user}-*/{README,move_in.sh}
cd $td/${gh_user}-* && $tar -cf - . | (cd; tar -xvf -)
cd -
rm -rf $td

if [ ! -d ~/.ssh/ ]; then
  mkdir ~/.ssh/
  chmod 700 ~/.ssh
fi

if [ ! -f ~/.ssh/authorized_keys ]; then
  touch ~/.ssh/authorized_keys
  chmod 600 ~/.ssh/authorized_keys
fi

if [ $os == "OpenBSD" ]; then
  if [ -f ~/.profile ]; then
    mv ~/.profile ~/.profile.orig
  fi
  mv ~/.profile-openbsd ~/.profile
  rm -f .cshrc .login .mailrc
fi

# Dump stuff we don't need on OS X?
if [ $os = "Darwin" ]; then
  rm -rf ~/.fluxbox
  rm -f ~/.conkyrc
  rm -f ~/.xsession
fi

if [ ! -f ~/.git-prompt.sh ]; then
  curl -s -o ~/.git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

if which git >/dev/null 2>&1; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  if which vim >/dev/null 2>&1; then
    if [ ! -d ~/.vim/plugged ]; then
      vim +PlugInstall
    fi
  else
    echo 'You need to install vim'
  fi
else
  echo 'You need to install git'
fi
