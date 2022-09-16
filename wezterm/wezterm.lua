local wez = require("wezterm")
local keys = require("keybinds")
local events = require("events")
local key_tables = require("key-tables")
events.register()
return {disable_default_key_bindings = true, leader = {key = "t", mods = "CTRL", timeout_miliseconds = 1000}, keys = keys, key_tables = key_tables, color_scheme = "Catppuccin Mocha", inactive_pane_hsb = {saturation = 0.9, brightness = 0.3}, font_size = 10, font = wez.font_with_fallback({"JetBrainsMono Nerd Font", "Broot Icons Visual Studio Code"}), scrollback_lines = 3000, enable_scroll_bar = true, tab_bar_at_bottom = true, window_decorations = "NONE", window_background_image = "/home/gasacchi/Pictures/HayasakaAi-opt.gif", window_background_opacity = 1.0, use_fancy_tab_bar = false, warn_about_missing_glyphs = false}
