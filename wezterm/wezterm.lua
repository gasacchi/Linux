local w = require "wezterm"
local keys = require "keybinds"


return {
  disable_default_key_bindings = true,
  leader = { key = "t", mods = "CTRL", timeout_miliseconds = 1000},
  keys = keys,
  color_scheme = "Catppuccin Mocha",
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.3
  },
  -- Fonts
  font_size = 10,
  font = w.font_with_fallback {
    "JetBrainsMono Nerd Font",
  },
  -- Ignore missing glyphs
  -- warn_about_missing_glyphs = false,
  -- Tab bar
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  --  Window
  window_decorations = "NONE",
  window_background_image = "/home/gasacchi/Pictures/HayasakaAi.gif",
  window_background_image_hsb = {
    brightness = 1
  },
  window_background_opacity = 1.0,
}
