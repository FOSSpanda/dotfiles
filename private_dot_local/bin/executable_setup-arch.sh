#!/bin/bash
echo "package install"
read -p "Press key to continue.. " -n1 -s
if [  -f "/etc/arch-release" ]; then

  sudo pacman -Syu
  
  sudo pacman -Sy --needed \
    sway swayidle swaylock mako bat most less micro \
    git fuzzel fzf thunar curl hyfetch flatpak pkg-config \
    xdg-desktop-portal-wlr xdg-desktop-portal-gtk ttf-font-awesome  \
    xorg-xwayland firefox noto-fonts noto-fonts-emoji \
    waybar breeze-icons fontconfig pavucontrol cmake \
    linux-headers gvfs polkit-kde-agent thunar-archive-plugin \
    thunar-volman unzip cmake meson xdg-user-dirs jq pamixer \
    grim slurp steam wl-clipboard wget neomutt bpytop \
    neovim wayland-protocols libpulse rsync vlc gettext \
    discord ttf-nerd-fonts-symbols fish wezterm \
    ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono \
    spotify-launcher vorta telegram-desktop git base-devel

# #Sway Audio Inhibit
#   cd ~/Downloads/git
#   git clone git@github.com:ErikReider/SwayAudioIdleInhibit.git
#   cd SwayAudioIdleInhibit
#   meson build
#   ninja -C build
#   sudo meson install -C build
#   cd ~

else
  exit "Only setup for arch!" 1;
fi

echo "rust-install"
read -p "Press key to continue.. " -n1 -s

which rustc
if [ "$?" -ne "0" ]
then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  . .cargo/env

  sudo pacman -Sy rustup
fi

which paru
if [ "$?" -ne "0" ]
then
  echo "paru"
  echo $PWD
  dir=${pwd}
  mkdir -p ~/Downloads/git
  cd ~/Downloads/git
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  echo $PWD
  cd $dir
  echo $PWD
else
  paru --gendb
fi

cargo install alacritty
cargo install eza
cargo install zoxide
cargo install vivid



echo "flatpak time"
read -p "Press key to continue.. " -n1 -s

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "oh my posh"
read -p "Press key to continue.. " -n1 -s

curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

exit


