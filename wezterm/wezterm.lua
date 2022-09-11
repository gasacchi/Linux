local w = require "wezterm"

return {
  color_scheme = "Catppuccin Mocha",
  -- Fonts
  font_size = 10,
  font = w.font_with_fallback {
    "JetBrainsMono Nerd Font",
    "Broot Icons Visual Studio Code"
  },
 -- Ignore missing glyphs
  warn_about_missing_glyphs = false,
  -- Tab bar
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  --  Window
  window_decorations = "NONE",
  window_background_image = "/home/gasacchi/Pictures/HayasakaAi.gif",
  window_background_image_hsb = {
    brightness = 0.9
  },
  window_background_opacity = 1.0,
}