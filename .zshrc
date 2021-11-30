source ~/.sh/vars

export ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
export HISTSIZE=1000000
export SAVEHIST=1000000
export CASE_SENSITIVE="true"
export SHOW_AWS_PROMPT="false"

# zgen
if [[ ! -f "${HOME}/.zgen/zgen.zsh" ]]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi
source "${HOME}/.zgen/zgen.zsh"

if command -v brew &>/dev/null; then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# sensible ctrl-w/u & alt arrow behaviour
autoload -U select-word-style
select-word-style bash
bindkey \^U backward-kill-line
bindkey "ç" fzf-cd-widget # fzf alt+c

if ! zgen saved; then
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/aws
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/fzf
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-extras
  zgen oh-my-zsh plugins/golang
  zgen oh-my-zsh plugins/man
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/ssh-agent
  zgen oh-my-zsh plugins/terraform

  if [[ $ARCH == "x86_64" ]]; then
    zgen oh-my-zsh plugins/vagrant
  fi

  if [[ $OS == "Darwin" ]]; then
    zgen oh-my-zsh plugins/macos
  fi

  if command -v zoxide >/dev/null 2>&1; then
    zgen load ajeetdsouza/zoxide
  fi

  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

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
setopt no_auto_remove_slash
unsetopt correct_all

local ret_status="%(?:%{$fg[green]%}»:%{$fg[red]%}»)"

newline=$'\n'
PROMPT='%{$fg_bold[green]%}%p%{$reset_color%}[%{$fg[yellow]%}%T%{$reset_color%}] %{$fg[cyan]%}%m %{$fg_bold[blue]%}%~%1(j: (%j):) %{$reset_color%}$(git_prompt_info)${newline}${ret_status}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg_bold[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

[ -f ~/.sh/proxy ] && source ~/.sh/proxy
[ -f ~/.sh/all ] && source ~/.sh/all
[ -f ~/.sh/private ] && source ~/.sh/private
[ -f ~/.sh/work ] && source ~/.sh/work
[ -f ~/.sh/functions ] && source ~/.sh/functions
[ -f ~/.sh/aliases ] && source ~/.sh/aliases
[ -f ~/.sh/$OS ] && source ~/.sh/$OS
[ -f ~/.sh/$SHELL ] && source ~/.sh/$SHELL
[ -f ~/.sh/local ] && source ~/.sh/local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.todo ] && (echo "** TODO LIST **"; cat ~/.todo)

# local zsh completions
[ -d ~/.zsh/completion ] && fpath=(~/.zsh/completion $fpath)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
