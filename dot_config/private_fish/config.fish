if status is-interactive
    fish_add_path -g -p ~/.local/bin ~/.cargo/bin
    hyfetch
    oh-my-posh init fish --config ~/.config/ohmyposh/tdp.toml | source
    abbr --add ls eza --icons
    set -gx EDITOR nvim
    # Commands to run in interactive sessions can go here
end
