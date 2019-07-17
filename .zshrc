if [[ ! -f "${HOME}/.zgen/zgen.zsh" ]]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/aws
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/dracula
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-extras
  zgen oh-my-zsh plugins/go
  zgen oh-my-zsh plugins/golang
  zgen oh-my-zsh plugins/man
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/ssh-agent
  zgen oh-my-zsh plugins/terraform
  zgen oh-my-zsh plugins/vagrant
  zgen oh-my-zsh plugins/web-search
  zgen oh-my-zsh plugins/z

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load andrewferrier/fzf-z

  zgen save
fi

bindkey -e

# bash style ctrl-w/u
bindkey '^U' backward-kill-line
bindkey '^W' backward-delete-word
autoload -U select-word-style select-word-style bash

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

# local ret_status="%(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ )"
local ret_status="%(?:%{$fg[green]%}»:%{$fg[red]%}»)"

# PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$reset_color%}[%{$fg[yellow]%}%T%{$reset_color%}] %{$fg[cyan]%}%m %{$fg_bold[blue]%}%~%1(j: (%j):) %{$reset_color%}» $(git_prompt_info)% %{$reset_color%}'
newline=$'\n'
PROMPT='%{$fg_bold[green]%}%p%{$reset_color%}[%{$fg[yellow]%}%T%{$reset_color%}] %{$fg[cyan]%}%m %{$fg_bold[blue]%}%~%1(j: (%j):) %{$reset_color%}$(git_prompt_info)${newline}${ret_status}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg_bold[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

[ -d ~/Dropbox ] && PATH=~/Dropbox/bin:~/Dropbox/bin/$OS:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/.local/bin:$PATH

[ -f ~/.sh/proxy ] && source ~/.sh/proxy
[ -f ~/.sh/all ] && source ~/.sh/all
[ -f ~/.sh/aliases ] && source ~/.sh/aliases
[ -f ~/.sh/private ] && source ~/.sh/private
[ -f ~/.sh/functions ] && source ~/.sh/functions
[ -f ~/.sh/$OS ] && source ~/.sh/$OS
[ -f ~/.sh/$SHELL ] && source ~/.sh/$SHELL
[ -f ~/.sh/local ] && source ~/.sh/local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.todo ] && (echo "** TODO LIST **"; cat ~/.todo)

if command -v >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

function auto_pipenv_shell {
    if [ ! -n "${PIPENV_ACTIVE+1}" ]; then
        if [ -f "Pipfile" ] ; then
            pipenv shell
        fi
    fi
}

function cd {
    builtin cd "$@"
    auto_pipenv_shell
}

auto_pipenv_shell
