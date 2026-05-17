---------------------------
-- ENVIRONMENT VARIABLES --
---------------------------

local home = os.getenv("HOME")

-- Customization
hl.env("XCURSOR_THEME", "BreezeX-Light")
hl.env("HYPRCURSOR_THEME", "BreezeX-Light-hyprcursor")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "28")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("QS_ICON_THEME", "Numix-Circle")

-- Nvidia
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- AMD
hl.env("LIBVA_DRIVER_NAME", "radeonsi")

-- Force Wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("SDL_VIDEODRIVER", "wayland,wayland,x11")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Better support for screen sharing.
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Settings
hl.env("HYPRSHOT_DIR", home .. "/Pictures/Screenshots")

hl.config({
  cursor = {
    no_hardware_cursors = 2,
  },
  xwayland = {
    force_zero_scaling = true,
  },
})
