echo "package install"
read -p "Press key to continue.. " -n1 -s

if [ -f "/etc/arch-release" ]; then
  sudo pacman -Syu
  sudo pacman -Sy --needed \
    stow sway swaylock mako bat most less micro \
    git fuzzel fzf thunar curl hyfetch flatpak pkg-config \
    xorg-xwayland firefox xdg-desktop-portal-wlr \
    xdg-desktop-portal-gtk noto-fonts noto-fonts-emoji \
    waybar pavucontrol cmake linux-headers gvfs polkit-gnome \
    thunar-archive-plugin thunar-volman unzip meson \
    xdg-user-dirs jq grim slurp sway-contrib wl-clipboard \
    discord telegram-desktop

elif [ -f "/etc/debian-version"]; then
  sudo dpkg --add-architecture i386

  sudo apt update

  sudo apt install \
    stow sway swayidle swaylock mako-notifier bat most less micro \
    git fuzzel fzf thunar curl hyfetch flatpak pkg-config \
    xdg-desktop-portal-wlr xdg-desktop-portal-gtk fonts-font-awesome  \
    xwayland firefox fonts-noto fonts-noto-color-emoji \
    waybar breeze-icon-theme nala libfontconfig-dev \
    pavucontrol cmake linux-headers-amd64 gvfs polkit-kde-agent-1 \
    thunar-archive-plugin thunar-volman thunar-gtkhash unzip \
    cmake meson xdg-user-dirs jq pamixer grim slurp \
    steam-installer steam-devices autotiling libfuse2 \
    wl-clipboard

  wget "https://discord.com/api/download?platform=linux&format=deb" -O ~/Downloads/discord.deb

  sudo apt install ./Downloads/discord.deb

echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt update
sudo apt install fish

#add packages for popos
else
  exit "Only setyup for debian and arch!" 1;
fi

echo "flatpak time"
read -p "Press key to continue.. " -n1 -s

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

if [ -f "/etc/debian-version"]; then
  flatpak install org.telegram.desktop
fi

echo "rust"
read -p "Press key to continue.. " -n1 -s

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. .cargo/env #check for fish!

cargo install alacritty
cargo install eza
cargo install zoxide
cargo install vivid


echo "oh my posh"
read -p "Press key to continue.. " -n1 -s

curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

exit
