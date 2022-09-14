local w = require "wezterm"
local events = require"events"
local keys = require "keybinds"
local key_tables = require "key_tables"

events.register()

return {
  disable_default_key_bindings = true,
  leader = { key = "t", mods = "CTRL", timeout_miliseconds = 1000 },
  keys = keys,
  key_tables = key_tables,
  color_scheme = "Catppuccin Mocha",
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.3
  },
  -- Fonts
  font_size = 10,
  font = w.font_with_fallback {
    "JetBrainsMono Nerd Font",
    "Broot Icons Visual Studio Code"
  },
  -- Ignore missing glyphs
  warn_about_missing_glyphs = false,
  scrollback_lines = 3000,
  enable_scroll_bar = true,
  -- Tab bar
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  --  Window
  window_decorations = "NONE",
  window_background_image = "/home/gasacchi/Pictures/HayasakaAi-opt.gif",
  window_background_image_hsb = {
    brightness = 1
  },
  window_background_opacity = 1.0,
}
