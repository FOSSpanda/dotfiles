if status is-interactive
    hyfetch
    oh-my-posh init fish --config ~/.config/ohmyposh/tdp.toml | source
    abbr --add ls --position command "eza --icons"
    # Commands to run in interactive sessions can go here
end
