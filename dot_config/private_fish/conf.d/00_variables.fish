set -gx ANSIBLE_NOCOWS 1
set -gx ARCH (arch)
set -gx EDITOR nvim
set -gx GOPASS_NO_REMINDER fuckoff
set -gx K9SCONFIG ~/.config/k9s
set -gx K9SCONFIG ~/.config/k9s
set -gx LESS -niSRXF
set -gx OS (uname -s)
set -gx SHELL_NAME (basename $SHELL)
set -gx TERM xterm-color
set -gx TF_PLUGIN_CACHE_DIR ~/.terraform.d/plugin-cache

set -gx AWS_DEFAULT_REGION eu-west-2
set -gx AWS_PAGER ""

set -gx FZF_DEFAULT_COMMAND 'fd --hidden --exclude "node_modules" --exclude ".git"'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND --type d"

# support colours in less/manpages
set -gx LESS_TERMCAP_mb (echo -e '\e[01;31m')
set -gx LESS_TERMCAP_md (echo -e '\e[01;31m')
set -gx LESS_TERMCAP_me (echo -e '\e[0m')
set -gx LESS_TERMCAP_se (echo -e '\e[0m')
set -gx LESS_TERMCAP_so (echo -e '\e[01;44;33m')
set -gx LESS_TERMCAP_ue (echo -e '\e[0m')
set -gx LESS_TERMCAP_us (echo -e '\e[01;32m')
