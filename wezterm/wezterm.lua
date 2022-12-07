-- Wezterm Configuration file

local wez = require 'wezterm'
local keys = require 'keybinds'
local events = require 'events'
local key_tables = require 'key-tables'

local bg_path = '/home/gasacchi/Dev/github/Linux/assets/HayasakaAi-opt.gif'

-- Register all custom events
events.register()

return {
  disable_default_key_bindings = true,
  check_for_updates = false,
  leader = {
    key = 't',
    mods = 'CTRL',
    timeout_miliseconds = 1000,
  },
  keys = keys,
  key_tables = key_tables,
  color_scheme = 'Catppuccin Mocha',
  foreground_text_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 0.5,
  },
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.3,
  },
  font_size = 10,
  font =
  wez.font_with_fallback{
    'BigBlue_TerminalPlus Nerd Font',
    'Broot Icons Visual Studio Code'
  },
  warn_about_missing_glyphs = false,
  scrollback_lines = 3000,
  enable_scroll_bar = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  window_decorations = 'NONE',
  window_background_image = bg_path,
  window_background_opacity = 1.0
}
