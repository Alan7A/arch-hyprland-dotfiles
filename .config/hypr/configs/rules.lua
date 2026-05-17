----------------------------
-- WINDOWS AND WORKSPACES --
----------------------------

hl.workspace_rule({ workspace = "3", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "special:tidal", on_created_empty = "sone" })
hl.workspace_rule({ workspace = "2", layout = "scrolling" })

hl.window_rule({ float = true, match = { title = "Mission Center" } })
hl.window_rule({ float = true, match = { title = "Smile" } })
hl.window_rule({ float = true, match = { title = "Picture-in-Picture" } })
hl.window_rule({ center = true, stay_focused = true, match = { title = "Visual Studio Code", float = true } })
hl.window_rule({ center = true, match = { title = "Open Folder" } })
hl.window_rule({ float = true, match = { initial_title = "Emulator" } })
hl.window_rule({ tile = true, match = { initial_title = "TickTick" } })
hl.window_rule({ suppress_event = "maximize", match = { class = ".*" } })
hl.window_rule({ float = true, match = { title = "Calculator" } })

hl.layer_rule({
  blur = true,
  match = { namespace = "logout_dialog" },
})

hl.layer_rule({
  name = "vicinae",
  blur = true,
  ignore_alpha = 0,
  match = { namespace = "vicinae" },
})

hl.layer_rule({
  name = "noctalia",
  match = { namespace = "noctalia-background-.*$" },
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

hl.layer_rule({
  name = "bongocat",
  order = -1,
  match = { namespace = "bongocat-overlay" },
})
