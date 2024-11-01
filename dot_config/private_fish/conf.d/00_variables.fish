set -x ANSIBLE_NOCOWS 1
set -x ARCH (arch)
set -x CHECKPOINT_DISABLE 1
set -x EDITOR nvim
set -x GOPASS_NO_REMINDER fuckoff
set -x K9SCONFIG ~/.config/k9s
set -x K9SCONFIG ~/.config/k9s
set -x LESS -niSRXF
set -x OS (uname -s)
set -x SHELL_NAME (basename $SHELL)
set -x TERM xterm-color
set -x TF_PLUGIN_CACHE_DIR ~/.terraform.d/plugin-cache

set -x AWS_DEFAULT_REGION eu-west-2
set -x AWS_PAGER ""

set -x FZF_DEFAULT_COMMAND 'fd --hidden --exclude "node_modules" --exclude ".git"'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND --type d"

# support colours in less/manpages
set -x LESS_TERMCAP_mb (echo -e '\e[01;31m')
set -x LESS_TERMCAP_md (echo -e '\e[01;31m')
set -x LESS_TERMCAP_me (echo -e '\e[0m')
set -x LESS_TERMCAP_se (echo -e '\e[0m')
set -x LESS_TERMCAP_so (echo -e '\e[01;44;33m')
set -x LESS_TERMCAP_ue (echo -e '\e[0m')
set -x LESS_TERMCAP_us (echo -e '\e[01;32m')
