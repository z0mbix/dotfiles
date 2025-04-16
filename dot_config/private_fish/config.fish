if status is-interactive
    set fish_greeting

    fish_add_path ~/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.krew/bin
    fish_add_path ~/go/bin

    if command --query nvim
        set -x EDITOR nvim
        abbr vim nvim
        abbr vi nvim
    end
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
# source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Added by Windsurf
fish_add_path /Users/dwooldridge/.codeium/windsurf/bin
