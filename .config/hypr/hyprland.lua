--------------------------
-- ALAN HYPRLAND DOTFILES
--------------------------

hl.monitor({
  output = "DP-1",
  mode = "3440x1440@144",
  position = "0x0",
  scale = 1,
  supports_hdr = 1,
  bitdepth = 10,
})

hl.monitor({
  output = "HDMI-A-1",
  disabled = true,
})

require("configs.autostart")
require("configs.env")
require("configs.keybindings")
require("configs.lookAndFeel")
require("configs.input")
require("configs.rules")
require("configs.plugins")

-- For Noctalia Color templates
require("noctalia").apply_theme()
