if status is-interactive
    set fish_greeting

    set -g fish_escape_delay_ms 200
    bind \e. history-token-search-backward

    fish_add_path ~/.cargo/bin
    fish_add_path ~/go/bin
    fish_add_path ~/bin

    test -e ~/.config/fish/darwin.fish; and source ~/.config/fish/darwin.fish
    test -e ~/.config/fish/aliases.fish; and source ~/.config/fish/aliases.fish
    test -e ~/.config/fish/private.fish; and source ~/.config/fish/private.fish
    test -e ~/.config/fish/work.fish; and source ~/.config/fish/work.fish

    command --query starship; and starship init fish | source
    command --query atuin; and atuin init fish --disable-up-arrow | source
    command --query mise; and mise activate | source
    command --query zoxide; and zoxide init --cmd cd fish | source

    if command --query nvim
        set -x EDITOR nvim
        abbr vim nvim
        abbr vi nvim
    end
end
