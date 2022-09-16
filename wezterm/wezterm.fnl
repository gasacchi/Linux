(local wez (require :wezterm))
(local keys (require :keybinds))
(local events (require :events))
(local key-tables (require :key-tables))

(local wez-path (.. wez.config_dir "/"))

;; (local watch-list [:event.lua 
;;                    :keybinds.lua 
;;                    :key-tables.lua 
;;                    :launch-menu.lua])

(events.register)

;; (each [_ file (ipairs watch-list)]
;;     (wez.add_to_config_reload_watch_list (.. wez-path file)))

{:disable_default_key_bindings true
 :automatically_reload_config true
 :leader {:key :t :mods :CTRL :timeout_miliseconds 1000}
 : keys
 :key_tables key-tables
 :color_scheme "Catppuccin Mocha"
 :inactive_pane_hsb {:saturation 0.9 :brightness 0.3}
 :font_size 10
 :font (wez.font_with_fallback ["JetBrainsMono Nerd Font"
                                "Broot Icons Visual Studio Code"])
 :warn_about_missing_glyphs false
 :scrollback_lines 3000
 :enable_scroll_bar true
 :use_fancy_tab_bar false
 :tab_bar_at_bottom true
 :window_decorations :NONE
 :window_background_image :/home/gasacchi/Pictures/HayasakaAi-opt.gif
 :window_background_opacity 1.0}
