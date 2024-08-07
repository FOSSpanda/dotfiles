if status is-interactive
# Abbreviations
    abbr --add l eza --icons
    abbr --add ls eza --color=always --icons --group-directories-first 
    abbr --add cze chezmoi edit
    abbr --add cza chezmoi apply
    abbr --add cat bat
    abbr --add less most
    abbr --add cd.. "cd .."

# Set some global variables
    set -gx EDITOR micro 
    set -g fish_greeting
    set -gx MICRO_TRUECOLOR 1
# Commands to run in interactive sessions can go here
    fish_add_path -g -p ~/.local/bin ~/.cargo/bin /usr/local/go/bin ~/.spicetify/
    hyfetch
    oh-my-posh init fish --config ~/.config/ohmyposh/catppuccin_frappe_panda.omp.json | source

end
