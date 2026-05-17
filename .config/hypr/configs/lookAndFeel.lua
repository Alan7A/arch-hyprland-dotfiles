-------------------
-- LOOK AND FEEL --
-------------------

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 20,
    border_size = 2,
    col = {
      active_border = { colors = { "rgb(7aa2f7)", "rgb(bb9af7)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 10,
    active_opacity = 1.0,
    inactive_opacity = 0.80,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      ignore_opacity = true,
      size = 10,
      passes = 3,
      vibrancy = 0.1696,
      new_optimizations = true,
    },
  },

  animations = {
    enabled = true,
  },

  layout = {
    single_window_aspect_ratio = { 16, 9 },
  },

  dwindle = {
    preserve_split = true,
    force_split = 2,
    split_width_multiplier = 1.3,
  },

  master = {
    new_status = "master",
  },

  misc = {
    focus_on_activate = true,
    force_default_wallpaper = -1,
    disable_hyprland_logo = false,
    animate_manual_resizes = true,
  },

  cursor = {
    default_monitor = "DP-1",
  },

  plugin = {
    -- horza = {
    --   background_source = "hyprpaper",
    --   background_blur_radius = 3.0,
    --   background_blur_passes = 1,
    --   background_blur_spread = 1.0,
    --   background_blur_strength = 1.0,
    --   background_tint = 0.20,
    -- },
  },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.curve("springWindow", { type = "spring", mass = 1, stiffness = 65, dampening = 13 })
hl.curve("springMove", { type = "spring", mass = 1, stiffness = 65, dampening = 13 })
hl.curve("springWorkspace", { type = "spring", mass = 1, stiffness = 55, dampening = 11 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.2, spring = "springWindow", style = "popin 86%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.0, bezier = "quick", style = "popin 86%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2.2, spring = "springMove" })
hl.animation({ leaf = "border", enabled = true, speed = 5.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 60, bezier = "linear", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.0, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.8, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.4, bezier = "almostLinear" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.8, spring = "springWindow", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "quick", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 0.8, spring = "springWorkspace", style = "slidefade 20%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 0.8, spring = "springWorkspace", style = "slidevert" })
