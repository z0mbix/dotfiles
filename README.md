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

The Brewfile stays in this repository and is not copied to `~/Brewfile`.
The macOS bundle hook reads it directly from the source directory. To apply
it manually from this repository or one of its subdirectories:

```shell
mise run brew:apply
```

The task is defined in `.config/mise.toml`, which is repository tooling and
is excluded from chezmoi's managed targets. From outside the repository:

```shell
brew bundle --file="$(chezmoi source-path)/Brewfile"
```

## Install selected parts

```shell
$ ./scripts/install --list
$ ./scripts/install nvim
$ ./scripts/install --dry-run --verbose nvim fish tmux
```

Run this from the chezmoi source directory. Component names come from their
target paths without the leading dot, the `.config/` prefix, a trailing `rc`
or `_profile`, or a file extension. Any other flag goes straight to
`chezmoi apply`. Scripts in `.chezmoiscripts` are not run, so on a new machine
run `chezmoi init z0mbix` first, then this script, and install tmux plugins
yourself with `prefix + I`.

## Import home-directory changes

Run these from the chezmoi source directory:

```shell
./scripts/show-modified
./scripts/show-modified --diff
./scripts/import-modified --dry-run
./scripts/import-modified
git diff
```

The diff shows rendered source → home, so added lines are home-directory
changes. Import makes home the source of truth for differing managed regular
files, including when both copies were edited. It does not apply to home or
stage or commit changes. Templates are reported and skipped: merge their edits
manually with `chezmoi merge <path>`. New unmanaged files need an explicit
`chezmoi add <path>`; deletions and symlink changes are not imported.

Use `show-modified --skip-templates` to filter templates, or
`show-modified --paths-only --null` for NUL-separated paths.

## Host-specific Git settings

The shared Git config includes `~/.gitconfig.local` last. Keep device-specific
credential helpers and other overrides there. This file is not managed or
synced, and hosts without it use just the shared settings. Git reads the
include directly, so local edits take effect without running chezmoi.

## Host-specific Claude settings

`dot_claude/modify_settings.json` manages the thinking and attribution
preferences while preserving other local settings, including Rex hooks.
These hooks stay on the machines where they were installed.

## Host-specific AWS profiles

`dot_aws/config.tmpl` contains the shared defaults and appends
`~/.aws/config.local` when that file exists. Keep machine-specific profiles
and their service sections in that local file; it is not managed or synced.
Hosts without it receive only the shared defaults. AWS reads the resulting
`~/.aws/config`; chezmoi handles the include when rendering the template.

After editing `~/.aws/config.local`, render it into the AWS config with:

```shell
chezmoi diff ~/.aws/config
chezmoi apply ~/.aws/config
```

Edit the local fragment for host-specific changes rather than running
`chezmoi re-add ~/.aws/config`. Keep credentials in the existing credential
provider or `~/.aws/credentials`.

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
