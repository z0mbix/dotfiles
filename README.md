# dotfiles

## Install chezmoi

#### Mac

```shell
$ brew install fish chezmoi git neovim ghostty
$ vim /etc/shells # add /opt/homebrew/bin/fish
$ chsh -s /opt/homebrew/bin/fish
```

Quit Terminal, and open Ghostty:

```shell
$ chezmoi init --apply z0mbix
```

#### Linux

```shell
$ sudo apt install fish git neovim
$ BINDIR=~/bin sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply z0mbix
$ sudo chsh -s /usr/bin/fish
```

#### FreeBSD

```shell
$ sudo pkg install chezmoi fish git neovim
$ sudo chsh -s /usr/local/bin/fish
$ chezmoi init --apply z0mbix
```

## Update

```shell
$ chezmoi diff
$ chezmoi apply --verbose
$ chezmoi apply --dry-run
```

## Work Setup

Add the following host to `~/.ssh/config.user`:

```sshconfig
Host github-personal
   User git
   PreferredAuthentications publickey
   PasswordAuthentication no
   RequestTTY no
   HostName github.com
   IdentityFile ~/path/to/private/key
   IdentitiesOnly yes
   ForwardAgent no
```

then add the following to `.git/config`:

```gitconfig
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
        ignorecase = true
        precomposeunicode = true
[submodule]
        active = .
[remote "origin"]
        url = ssh://git@github-personal/z0mbix/dotfiles.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
        remote = origin
        merge = refs/heads/main
[user]
        name = z0mbix
        email = zombie@zombix.org
```
