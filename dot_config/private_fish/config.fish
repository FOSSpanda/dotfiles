if status is-interactive
    fish_add_path -g -p ~/.local/bin ~/.cargo/bin
    hyfetch
    oh-my-posh init fish --config ~/.config/ohmyposh/tdp.toml | source
    abbr --add ls --position command "eza --icons"
    set -gx EDITOR helix
    # Commands to run in interactive sessions can go here
end
