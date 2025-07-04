# 🌟 Alan's Arch Linux + Hyprland Dotfiles

My personal Arch Linux + Hyprland setup. This repository contains my versioned dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/), allowing for a clean, modular, and easily replicable configuration.

<div align="center">

[![Hyprland](https://img.shields.io/badge/WM-Hyprland-blue)](https://github.com/hyprwm/Hyprland)
[![Arch Linux](https://img.shields.io/badge/OS-Arch_Linux-blue)](https://archlinux.org/)

</div>

## 📸 Screenshots

## 📦 Main Packages

### System Components

| Category | Packages |
|----------|----------|
| **Window Manager** | `hyprland` and ecosystem (`hyprpanel`, `hyprpicker`, `hyprshot`, `hyprlock`, `hypridle`, `hyprpaper`, `hyprcursor`, `hyprsunset`, `hyprpolkitagent`) |
| **Terminal & Shell** | `kitty`, `zsh`, `oh-my-zsh`, `vim`, `paru` |
| **Application Launcher** | `wofi` |
| **System Utilities** | `wlogout`, `fastfetch`, `wf-recorder`, `playerctl`, `solaar`, `kdeconnect`, `nautilus-admin-gtk4`, `nautilus-image-converter`, `nautilus-open-any-terminal`  |
| **Appearance** | `breezex-cursor-theme`, `numix-circle-icon-theme-git`, `ttf-fira-sans`, `gtk-engine-murrine`, `nwg-look`, `qt5-wayland`  |
| **Miscellaneous** | `clipse`, `stow` |

### Flatpak

- Zen Browser
- Discord
- MissionCenter
- Smile
- Tidal HiFi
- Gnome Music

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
paru -S hyprland hyprpanel wofi vim neofetch wlogout solaar \
  breezex-cursor-theme numix-circle-icon-theme-git clipse \
  hyprpicker hyprshot hyprlock hypridle hyprpaper hyprcursor hyprsunset \
  gtk-engine-murrine wf-recorder ttf-fira-sans playerctl stow zsh ttf-meslo-nerd
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
  it.mijorus.smile \
  io.missioncenter.MissionCenter \
  com.mastermindzh.tidal-hifi \
  org.gnome.Music
```

### 4. Clone and Apply Dotfiles

```sh
cd ~
git clone git@github.com:Alan7A/arch-hyprland-dotfiles.git
mv arch-hyprland-dotfiles dotfiles
cd dotfiles

# Create symlinks using GNU Stow
stow .
```


### 5. Change Default Shell to Zsh

```sh
chsh -s /usr/bin/zsh
```

### 6. Install Oh-My-Zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
