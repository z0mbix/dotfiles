#!/usr/bin/env bash
set -uo pipefail

cmd=${1:-}
path=${2:-}
tty=${3:-}

foreground_args() {
    [[ -n $tty ]] || return 1
    ps -t "$tty" -o command= 2>/dev/null | grep -m1 -E "(^|/)$1( |\$)"
}

k9s_context() {
    local args ctx clusters
    args=$(foreground_args k9s)
    ctx=$(printf '%s\n' "$args" | grep -oE -- '--context[= ][^ ]+' | head -1 | sed -E 's/^--context[= ]//')
    if [[ -z $ctx ]]; then
        clusters="${XDG_CONFIG_HOME:-$HOME/.config}/k9s/clusters"
        ctx=$(find "$clusters" -mindepth 3 -maxdepth 3 -name config.yaml -exec stat -f '%m %N' {} + 2>/dev/null \
            | sort -rn | head -1 | sed -E "s#.*/clusters/([^/]+)/.*#\\1#")
    fi
    [[ -z $ctx ]] && ctx=$(kubectl config current-context 2>/dev/null)
    printf '⎈ %s' "${ctx:-k9s}"
}

ssh_host() {
    local host
    host=$(foreground_args ssh | awk '{
        for (i = 2; i <= NF; i++) {
            if ($i ~ /^-[bcDEeFIiJLlmOopQRSWw]$/) { i++; continue }
            if ($i ~ /^-/) continue
            print $i; exit
        }
    }')
    host=${host##*@}
    printf '󰒋 %s' "${host:-ssh}"
}

case $cmd in
    k9s) k9s_context ;;
    ssh) ssh_host ;;
    *)   printf '%s' "${path##*/}" ;;
esac
