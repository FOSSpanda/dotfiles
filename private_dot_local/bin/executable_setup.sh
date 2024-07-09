#!/bin/bash
echo "package install"
read -p "Press key to continue.. " -n1 -s
if [  -f "/etc/debian_version" ]; then

  sudo dpkg --add-architecture i386

  sudo apt update

  sudo apt install \
    sway swayidle swaylock mako-notifier bat most less micro \
    git fuzzel fzf thunar curl hyfetch flatpak pkg-config \
    xdg-desktop-portal-wlr xdg-desktop-portal-gtk fonts-font-awesome  \
    xwayland firefox fonts-noto fonts-noto-color-emoji \
    waybar breeze-icon-theme nala libfontconfig-dev \
    pavucontrol cmake linux-headers-amd64 gvfs polkit-kde-agent-1 \
    thunar-archive-plugin thunar-volman thunar-gtkhash unzip \
    cmake meson xdg-user-dirs jq pamixer grim slurp \
    steam-installer steam-devices autotiling libfuse2 \
    wl-clipboard wget mutt-wizard neomutt bpytop \
    neovim python3-neovim zram-tools wayland-protocols \
    libwayland-dev libpulse-dev rsync

#Discord
  wget "https://discord.com/api/download?platform=linux&format=deb" -O ~/Downloads/discord.deb
  sudo apt install ./Downloads/discord.deb

#NerdFonts - Symbols Only
  wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.tar.xz" -O ~/Downloads/NerdFontsSymbolsOnly.tar.xz
  mkdir -p ~/.local/share/fonts/NerdFontSymbols
  tar -xf ~/Downloads/NerdFontsSymbolsOnly.tar.xz  -C ~/.local/share/fonts/NerdFontSymbols

#Fish shell
  echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
  curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
  sudo apt update
  sudo apt install fish

#WezTerm
  curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
  echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  sudo apt update
  sudo apt install wezterm

#Sway Audio Inhibit
  cd ~/Downloads/git
  git clone git@github.com:ErikReider/SwayAudioIdleInhibit.git
  cd SwayAudioIdleInhibitSwayAudioIdleInhibit
  meson build
  ninja -C build
  sudo meson install -C build
  cd ~

else
  exit "Only setup for debian!" 1;
fi


echo "flatpak time"
read -p "Press key to continue.. " -n1 -s

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

if [ -f "/etc/debian-version" ]; then
  flatpak install com.borgbase.Vorta
  flatpak install org.telegram.desktop
fi

echo "rust"
read -p "Press key to continue.. " -n1 -s

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. .cargo/env

cargo install alacritty
cargo install eza
cargo install zoxide
cargo install vivid


echo "oh my posh"
read -p "Press key to continue.. " -n1 -s

curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

exit


