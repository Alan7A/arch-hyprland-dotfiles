-----------------
-- KEYBINDINGS --
-----------------

local terminal = "kitty"
local fileManager = "kitty yazi"
local menu = "vicinae toggle"
local browser = "zen-browser"
local editor = "code"
local discord = "vesktop"
local thumbButton = "mouse:277"
local emojiPicker = "vicinae vicinae://launch/core/search-emojis"
local resourceManager = "kitty btop"
local clipboard = "vicinae vicinae://launch/clipboard/history"
local powerMenu = "noctalia msg panel-toggle session"
local toggleHyprsunset = "pgrep -x hyprsunset >/dev/null && pkill hyprsunset || hyprsunset -t 3800"
local mainMod = "SUPER"

local function with_description(description, flags)
  local opts = flags or {}
  opts.description = description
  return opts
end

local function bind_exec(keys, command, description, flags)
  hl.bind(keys, hl.dsp.exec_cmd(command), with_description(description, flags))
end

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), with_description("Close active window"))
bind_exec(mainMod .. " + T", terminal, "Open terminal")
bind_exec(mainMod .. " + B", browser, "Open browser")
bind_exec(mainMod .. " + V", editor, "Open editor")
bind_exec(mainMod .. " + W", discord, "Open Discord client")
bind_exec(mainMod .. " + F", fileManager, "Open file manager")
bind_exec(mainMod .. " + C", "gnome-calculator", "Open calculator")
bind_exec(mainMod .. " + G", "steam", "Open Steam")
bind_exec(mainMod .. " + SPACE", menu, "Launch app launcher")
bind_exec("CTRL + SHIFT + Escape", resourceManager, "Launch resource manager")
bind_exec(mainMod .. " + Escape", powerMenu, "Launch power menu")
bind_exec(mainMod .. " + period", emojiPicker, "Launch emoji picker")
bind_exec(mainMod .. " + X", clipboard, "Launch clipboard manager")
bind_exec(mainMod .. " + L", "noctalia msg session lock", "Lock screen")
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }), with_description("Toggle fullscreen"))
hl.bind(mainMod .. " + Y", hl.dsp.window.float({ action = "toggle" }), with_description("Toggle floating"))
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"), with_description("Toggle split"))
bind_exec(mainMod .. " + F1", toggleHyprsunset, "Toggle blue light filter")

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }), with_description("Focus window left"))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }), with_description("Focus window right"))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }), with_description("Focus window up"))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }), with_description("Focus window down"))

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), with_description("Switch to workspace " .. i))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), with_description("Move active window to workspace " .. i))
end

hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "+1" }), with_description("Switch to next workspace"))
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "-1" }), with_description("Switch to previous workspace"))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ workspace = "+1" }), with_description("Move active window to next workspace"))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ workspace = "-1" }), with_description("Move active window to previous workspace"))

hl.bind(mainMod .. " + ALT + CTRL + Right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), with_description("Resize active window wider", { repeating = true }))
hl.bind(mainMod .. " + ALT + CTRL + Left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), with_description("Resize active window narrower", { repeating = true }))
hl.bind(mainMod .. " + ALT + CTRL + Up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), with_description("Resize active window shorter", { repeating = true }))
hl.bind(mainMod .. " + ALT + CTRL + Down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), with_description("Resize active window taller", { repeating = true }))

hl.bind(mainMod .. " + ALT + Left", hl.dsp.window.move({ direction = "l" }), with_description("Move window left", { repeating = true }))
hl.bind(mainMod .. " + ALT + Right", hl.dsp.window.move({ direction = "r" }), with_description("Move window right", { repeating = true }))
hl.bind(mainMod .. " + ALT + Up", hl.dsp.window.move({ direction = "u" }), with_description("Move window up", { repeating = true }))
hl.bind(mainMod .. " + ALT + Down", hl.dsp.window.move({ direction = "d" }), with_description("Move window down", { repeating = true }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("tidal"), with_description("Toggle tidal special workspace"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:tidal" }), with_description("Move active window to tidal special workspace"))
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.window.move({ workspace = 3 }), with_description("Move active window to workspace 3"))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), with_description("Scroll to next existing workspace"))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), with_description("Scroll to previous existing workspace"))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), with_description("Move window with mouse", { mouse = true }))
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), with_description("Resize window with mouse", { mouse = true }))

-- Media controls
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("noctalia msg media toggle"), with_description("Toggle media play/pause", { locked = true }))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("noctalia msg media pause"), with_description("Toggle media play/pause", { locked = true }))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("noctalia msg media next"), with_description("Skip to next media track", { locked = true }))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("noctalia msg media previous"), with_description("Skip to previous media track", { locked = true }))

-- Audio volume controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up 1"), with_description("Increase volume", { locked = true, repeating = true }))
hl.bind(mainMod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down"), with_description("Decrease volume by 5%", { locked = true, repeating = true }))
hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up"), with_description("Increase volume by 5%", { locked = true, repeating = true }))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down 1"), with_description("Decrease volume", { locked = true, repeating = true }))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("noctalia msg volume-mute"), with_description("Toggle audio mute", { locked = true }))


-- Screen brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), with_description("Increase brightness", { locked = true, repeating = true }))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), with_description("Decrease brightness", { locked = true, repeating = true }))

-- Screenshot
bind_exec("PRINT", "omasnap --copy --save", "Take region screenshot and edit")
bind_exec(
  mainMod .. " + PRINT",
  "omasnap",
  "Screenshot"
)
