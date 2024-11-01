# Esc+.
set -g fish_escape_delay_ms 200
bind \e. history-token-search-backward

# Right Alt+c to cd into a directory with fzf
bind ç fzf-cd-widget
