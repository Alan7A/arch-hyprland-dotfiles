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
  qt6-wayland \
  hyprqt6engine-git \

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
  swww \
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
  nautilus-open-any-terminal \
  vicinae-bin \
  visual-studio-code-bin \
  zoxide \
  eza \
  kdeconnect \

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
  io.github.celluloid_player.Celluloid \
  com.github.wwmm.easyeffects \
```

### 4. Clone and Apply Dotfiles

```sh
git clone https://github.com/Alan7A/fedora-post-install.git ~/dotfiles && \
cd ~/dotfiles && \
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
# Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Troubleshooting

---

#### Git configurations

```sh
git config --global init.defaultBranch main
git config --global core.editor "vim"
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
---

#### Fix dualboot showing different times

```sh
timedatectl set-local-rtc 1
```

---

#### Theme Flatpak apps

- This command makes flatpak apps to use the application's theme
  ```sh
  sudo flatpak override --filesystem=~/.themes
  ```
- Or you can use [stylepak](https://github.com/refi64/stylepak)

---

#### KDE Connect doesn't detect my device

This is most likely because some of the ports kdeconnect needs are not open. You can fix this following these steps:
1. Open firewall-config gui, in the left list, make sure you have selected the zone that your connection uses (for example Wired Connection → Public)
2. At the top, select the Ports tab and click the Add button
3. In the window that opens, In Port enter: `1714-1764` and in Protocol select `TCP`, then click OK
4. Repeat the same process but this time select `UDP` in Protocol.
5. Make sure the configuration is set to Permanent and then click on Options → Reload Firewalld to apply the changes.

As an alternative solution you can try the following commands
```sh
sudo firewall-cmd --permanent --add-port=1714-1764/tcp
sudo firewall-cmd --permanent --add-port=1714-1764/udp
sudo firewall-cmd --reload
```

---

#### Install rEFInd and rEFInd theme Regular

- Install [rEFInd](https://www.rodsbooks.com/refind/)
  ```sh
  sudo pacman -S refind
  ```
- Install [rEFInd theme Regular](https://github.com/bobafetthotmail/refind-theme-regular#refind-theme-regular)
  ```sh
  sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"
  ```