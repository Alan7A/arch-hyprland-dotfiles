# 🌟 Alan's Arch Linux + Hyprland Dotfiles

My personal Arch Linux + Hyprland setup. This repository contains my versioned dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/), allowing for a clean, modular, and easily replicable configuration.

<div align="center">

[![Hyprland](https://img.shields.io/badge/WM-Hyprland-blue)](https://github.com/hyprwm/Hyprland)
[![Arch Linux](https://img.shields.io/badge/OS-Arch_Linux-blue)](https://archlinux.org/)

</div>

## 📸 Screenshots


<div align="center">
  <img src="misc/previews/screenshot1.png" alt="Desktop Preview 1"/>
  <img src="misc/previews/screenshot2.png" alt="Desktop Preview 2"/>
</div>

## 📦 Main Packages

### System Components

| Category | Packages |
|----------|----------|
| **Window Manager** | `hyprland` and ecosystem (`hyprpanel`, `hyprpicker`, `hyprshot`, `hyprlock`, `hypridle`, `hyprpaper`, `hyprcursor`, `hyprsunset`, `hyprpolkitagent`, `xdg-desktop-portal-hyprland`) |
| **Terminal & Shell** | `kitty`, `zsh`, `oh-my-zsh`, `vim`, `paru` |
| **Application Launcher** | `vicinae` |
| **System Utilities** | `wlogout`, `fastfetch`, `wf-recorder`, `playerctl`, `solaar`, `kdeconnect`, `nautilus-admin-gtk4`, `nautilus-image-converter`, `nautilus-open-any-terminal`  |
| **Appearance** | `breezex-cursor-theme`, `numix-circle-icon-theme-git`, `ttf-fira-sans`, `gtk-engine-murrine`, `nwg-look`, `qt5-wayland`  |
| **Miscellaneous** | `stow` |    

### Flatpak

- Zen Browser
- Discord
- MissionCenter
- Smile
- Tidal HiFi
- Gnome Music
- Celulloid

## 🚀 Automatic Installation

> ⚠️ **Warning:** The installation script needs more testing and may not work as expected.

### 1. Give the script executable permissions
```sh
chmod +x install.sh
```
### 2. Run the script
```sh
./install.sh
```

## 🛠️ Manual Installation

### 1. Install AUR Helper (paru)

```sh
# Install paru if not installed
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### 2. Install Required Packages

```sh
# Hyprland and related tools
paru -S --noconfirm \
  hyprland \
  hyprpicker \
  hyprshot \
  hyprlock \
  hypridle \
  hyprpaper \
  hyprcursor \
  hyprsunset \
  hyprpolkitagent \
  xdg-desktop-portal-hyprland \
  hyprland-qtutils \
  qt5-wayland \
  qt6-wayland

# Hyprpanel and dependencies
paru -S --noconfirm \
  aylurs-gtk-shell-git \
  wireplumber \
  libgtop \
  bluez \
  bluez-utils \
  networkmanager \
  dart-sass \
  wl-clipboard \
  upower \
  gvfs \
  gtksourceview3 \
  libsoup3 \
  ags-hyprpanel-git

# Terminal and system tools
paru -S --noconfirm \
  vim \
  fastfetch \
  wlogout \
  solaar \
  wf-recorder \
  playerctl \
  stow \
  zsh \
  vicinae-bin

# Appearance
paru -S --noconfirm \
  breezex-cursor-theme \
  numix-circle-icon-theme-git \
  gtk-engine-murrine \
  ttf-fira-sans \
  ttf-meslo-nerd
```

### 3. Install Flatpak and Applications

```sh
# Install Flatpak
sudo pacman -S flatpak

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install applications
flatpak install flathub \
  app.zen_browser.zen \
  com.discordapp.Discord \
  io.missioncenter.MissionCenter \
  com.mastermindzh.tidal-hifi \
  org.gnome.Music \
  io.github.celluloid_player.Celluloid
```

### 4. Clone and Apply Dotfiles

```sh
git clone git@github.com:Alan7A/arch-hyprland-dotfiles.git ~/dotfiles
cd ~/dotfiles

# Create symlinks using GNU Stow
stow .
```


### 5. Change Default Shell to Zsh

```sh
chsh -s /usr/bin/zsh
```

### 6. Install Oh-My-Zsh and plugins

```sh
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
