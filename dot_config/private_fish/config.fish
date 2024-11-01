if status is-interactive
    set fish_greeting

    fish_add_path ~/.cargo/bin
    fish_add_path ~/go/bin
    fish_add_path ~/bin

    if command --query nvim
        set -x EDITOR nvim
        abbr vim nvim
        abbr vi nvim
    end
end
