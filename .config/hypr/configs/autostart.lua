---------------
-- AUTOSTART --
---------------

hl.on("hyprland.start", function()
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("qs -c noctalia-shell")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("vicinae server")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("kdeconnect-indicator")
  hl.exec_cmd("solaar --window=hide")
  -- hl.exec_cmd("flatpak run com.github.wwmm.easyeffects --gapplication-service")
  hl.exec_cmd("hyprctl setcursor BreezeX-Light-hyprcursor 28")
  -- hl.exec_cmd("xrandr --output DP-1 --primary") - DEPRECATED
  hl.exec_cmd("bongocat -c ~/.config/bongocat/bongocat.conf")
  hl.exec_cmd("hyprpm reload")

  -- Use nwg-look to set these GNOME preferences.
  -- hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Tokyonight-Dark"')
  -- hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
  -- hl.exec_cmd('gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"')
  -- hl.exec_cmd('gsettings set org.gnome.desktop.interface font-name "Fira Sans Semi-Light 11"')
  -- hl.exec_cmd('gsettings set org.gnome.desktop.interface cursor-theme "BreezeX-Light"')
end)
