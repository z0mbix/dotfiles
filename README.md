# dotfiles

## Install chezmoi

#### Mac

```shell
$ brew install fish chezmoi git neovim
$ sudo chsh -s /opt/homebrew/bin/fish
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
