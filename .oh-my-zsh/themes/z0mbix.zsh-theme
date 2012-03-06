# z0mbix (zombie@zombix.org)
local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%}'

local pwd='%{$fg[blue]%}%~%{$reset_color%}'

local user_pwd='%{$fg[blue]%}%n%{$fg[green]%}@%{$fg[magenta]%}%m'

#local date='%{$fg[yellow]%}|%{$fg[white]%}%D{%H}%D{%M}%{$fg[yellow]%}|%{$reset_color%}'
local date='%{$fg[yellow]%}|%{$fg[white]%}%D{%H}%{$fg[yellow]%}:%{$fg[white]%}%D{%M}%{$fg[yellow]%}|%{$reset_color%}'

local rvm=''
if [ -d ~/.rvm ]; then
  rvm='%{$fg[green]%}‹$(~/.rvm/bin/rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'

local git_branch='$(git_prompt_status) %{$reset_color%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT="${user_pwd}  ${pwd} $ "
RPROMPT="${return_code} ${git_branch} ${rvm} ${date}"
