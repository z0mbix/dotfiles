# Esc+.
# set -g fish_escape_delay_ms 200
bind escape,. history-token-search-backward
bind alt-delete backward-kill-path-component
# backward-kill-word stops at punctuation (e.g. '-'), so opt+backspace on
# "nrtc-dev-ccp" deletes back to the previous '-' rather than the whole token
bind alt-backspace backward-kill-word

# Right Alt+c to cd into a directory with fzf
bind ç fzf-cd-widget
