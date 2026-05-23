# Esc+.
# set -g fish_escape_delay_ms 200
bind escape,. history-token-search-backward
bind alt-delete backward-kill-path-component
bind alt-backspace backward-kill-path-component

# Right Alt+c to cd into a directory with fzf
bind ç fzf-cd-widget
