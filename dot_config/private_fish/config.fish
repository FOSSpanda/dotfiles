if status is-interactive
# Abbreviations
    abbr --add ls eza --icons
    abbr --add cze chezmoi edit
    abbr --add cza chezmoi apply
    abbr --add bat batcat
    abbr --add cat batcat
    abbr --add less most
    abbr --add cd.. "cd .."

# Set some global variables
    set -gx EDITOR micro
    set -g fish_greeting

# Commands to run in interactive sessions can go here
    fish_add_path -g -p ~/.local/bin ~/.cargo/bin
    hyfetch
    oh-my-posh init fish --config ~/.config/ohmyposh/tdp.toml | source

end
