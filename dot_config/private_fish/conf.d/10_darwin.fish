set -x HOMEBREW_INSTALL_BADGE 📦
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_AUTO_UPDATE 1

if test -z "$HOMEBREW_PREFIX"
    eval (/opt/homebrew/bin/brew shellenv)
end
