[[ -f /usr/local/share/antigen/antigen.zsh ]] && source /usr/local/share/antigen/antigen.zsh
[[ -f ~/.antigen.zsh ]] && source ~/.antigen.zsh

antigen use oh-my-zsh

bindkey -e

# bash style ctrl-w/u
bindkey '^U' backward-kill-line
bindkey '^W' backward-delete-word
autoload -U select-word-style
select-word-style bash

antigen bundles <<EOB
  aws
  command-not-found
  docker
  dracula
  git
  git-extras
  go
  golang
  man
  osx
  pip
  python
  ssh-agent
  terraform
  vagrant
  web-search
  zsh-users/zsh-syntax-highlighting
EOB

antigen apply

WORDCHARS='`~!@#$%^&*()-_=+[{]}\|;:",<.>/?'"'"
HISTSIZE=1000000
SAVEHIST=1000000
CASE_SENSITIVE="true"

setopt no_beep
setopt auto_cd
setopt menu_complete
setopt auto_list
setopt complete_in_word
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history
unsetopt correct_all

local ret_status="%(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ )"

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$reset_color%}[%{$fg[yellow]%}%T%{$reset_color%}] %{$fg[cyan]%}%m %{$fg_bold[blue]%}%~%1(j: (%j):) %{$reset_color%}» $(git_prompt_info)% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg_bold[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

export TERM="xterm-color"
export LESS="-niSRX"
export OS="$(uname -s)"
export GOPATH="$HOME"
export ANSIBLE_NOCOWS=1
export EDITOR=vim

# support colors in less/manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

[ -d ~/Dropbox ] && PATH=~/Dropbox/bin:~/Dropbox/bin/$OS:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH

[ -f ~/.sh/proxy ] && source ~/.sh/proxy
[ -f ~/.sh/aliases ] && source ~/.sh/aliases
[ -f ~/.sh/private ] && source ~/.sh/private
[ -f ~/.sh/functions ] && source ~/.sh/functions
[ -f ~/.sh/$OS ] && source ~/.sh/$OS
[ -f ~/.sh/$SHELL ] && source ~/.sh/$SHELL
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.todo ] && (echo "** TODO LIST **"; cat ~/.todo)
