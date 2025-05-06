#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}==> Installing base-devel and git...${NC}"
sudo pacman -S --needed base-devel git --noconfirm

echo -e "${GREEN}==> Installing paru AUR helper...${NC}"
if ! command -v paru &> /dev/null; then
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd ..
  rm -rf paru
else
  echo "paru already installed, skipping."
fi

echo -e "${GREEN}==> Installing main packages with paru...${NC}"
paru -S --noconfirm --needed \
  hyprland hyprpanel wofi vim neofetch wlogout solaar \
  xcursor-breeze numix-circle-icon-theme-git clipse \
  hyprpicker hyprshot hyprlock hypridle hyprpaper hyprcursor hyprsunset \
  gtk-engine-murrine wf-recorder ttf-fira-sans playerctl stow zsh ttf-meslo-nerd \
  kdeconnect

echo -e "${GREEN}==> Installing Flatpak and configuring Flathub...${NC}"
sudo pacman -S --noconfirm flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "${GREEN}==> Installing Flatpak apps...${NC}"
flatpak install -y flathub \
  app.zen_browser.zen \
  com.discordapp.Discord \
  it.mijorus.smile \
  io.missioncenter.MissionCenter \
  com.mastermindzh.tidal-hifi

echo -e "${GREEN}==> Cloning dotfiles...${NC}"
cd ~
if [ -d "dotfiles" ]; then
  echo "dotfiles folder already exists. Skipping clone."
else
  git clone git@github.com:Alan7A/arch-hyprland-dotfiles.git dotfiles
fi

cd ~/dotfiles

echo -e "${GREEN}==> Applying dotfiles using stow...${NC}"
stow .

echo -e "${GREEN}==> Changing default shell to zsh...${NC}"
chsh -s /usr/bin/zsh

echo -e "${GREEN}==> Installing Oh My Zsh...${NC}"
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "${GREEN}✅ Setup complete. Please reboot your system and login again to apply all changes.${NC}"
