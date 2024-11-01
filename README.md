# dotfiles

Install chezmoi on Mac:

```shell
$ brew install chezmoi
```

or on Linux:

```shell
$ BINDIR=~/bin sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply z0mbix
```

Set fish as your shell:

```shell
$ chsh -s /opt/homebrew/bin/fish
```

or:

```
$ chsh -s /usr/bin/fish
```

To update dotfiles on a device:

```shell
$ chezmoi diff
$ chezmoi apply
```
