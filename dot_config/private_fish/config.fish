if status is-interactive
    set fish_greeting
    set fish_color_valid_path

    fish_add_path ~/bin
    fish_add_path ~/.local/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.krew/bin
    fish_add_path ~/go/bin

    if command --query nvim
        set -x EDITOR nvim
        abbr vim nvim
        abbr vi nvim
    end
end
