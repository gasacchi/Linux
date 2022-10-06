;;; Keybinds module
(local w (require :wezterm))
(local a w.action)


(local scripts-dir (.. w.config_dir :/scripts/))


;; Keybinds related to basic functionality
(local basic
  [{:key :q :mods :LEADER :action a.QuitApplication}
   {:key :R :mods :LEADER|SHIFT :action :ReloadConfiguration}
   {:key :T :mods :LEADER|SHIFT :action (a.EmitEvent :open-workspace)}
   {:key :b :mods :LEADER :action (a.EmitEvent :rebuild-config)}
   {:key :c :mods :CTRL|SHIFT :action (a.CopyTo :Clipboard)}
   {:key :v :mods :CTRL|SHIFT :action (a.PasteFrom :Clipboard)}
   {:key :z :mods :LEADER :action a.ToggleFullScreen}
   {:key :c :mods :LEADER :action a.ShowLauncher}
   {:key :m :mods :LEADER :action (a.EmitEvent :toggle-maximize-window)}
   {:key :e :mods :LEADER :action (a.EmitEvent :toggle-broot)}
   {:key "," :mods :LEADER :action a.ShowDebugOverlay}
   {:key "."
    :mods :LEADER
    :action (a.Search {:CaseSensitiveString ""})}])

;; Activate key tables
(local activate-key-tables
 [{:key :S
   :mods :LEADER|SHIFT
   :action (a.Search {:CaseSensitiveString ""})}
  {:key "." :mods :LEADER :action (. a :ActivateCopyMode)}
  {:key :s
   :mods :LEADER|CTRL
   :action (a.ActivateKeyTable {:name :scroll_mode :one_shot false})}
  {:key :r
   :mods :LEADER
   :action (a.ActivateKeyTable {:name :resize_pane_mode
                                    :one_shot false})}
  {:key :F
   :mods :LEADER|SHIFT
   :action (a.ActivateKeyTable {:name :font_size_mode
                                    :one_shot false})}])

;; Tab control keybinds
(local tab 
  [{:key :1 :mods :LEADER :action (a.ActivateTab 0)}
   {:key :2 :mods :LEADER :action (a.ActivateTab 1)}
   {:key :3 :mods :LEADER :action (a.ActivateTab 2)}
   {:key :4 :mods :LEADER :action (a.ActivateTab 3)}
   {:key :5 :mods :LEADER :action (a.ActivateTab 4)}
   {:key :t :mods :LEADER :action (a.SpawnTab :DefaultDomain)}
   {:key :Tab :mods :LEADER :action a.ShowTabNavigator}
   {:key :n :mods :LEADER :action (a.ActivateTabRelative 1)}
   {:key :p :mods :LEADER :action (a.ActivateTabRelative -1)}
   {:key :D
    :mods :LEADER|SHIFT
    :action (a.CloseCurrentTab {:confirm true})}])

;; Pane control keybinds
(local pane
  [{:key :h :mods :LEADER :action (a.ActivatePaneDirection :Left)}
   {:key :l :mods :LEADER :action (a.ActivatePaneDirection :Right)}
   {:key :j :mods :LEADER :action (a.ActivatePaneDirection :Down)}
   {:key :k :mods :LEADER :action (a.ActivatePaneDirection :Up)}
   {:key :f :mods :LEADER :action a.TogglePaneZoomState}
   {:key :w
    :mods :LEADER
    :action (a.PaneSelect {:alphabet :aoeusnth})}
   {:key :W
    :mods :LEADER|SHIFT
    :action (a.PaneSelect {:mode :SwapWithActive})}
   {:key :d
    :mods :LEADER
    :action (a.CloseCurrentPane {:confirm true})}
   {:key :D
    :mods :LEADER|SHIFT
    :action (a.EmitEvent :close-other-pane )}
   {:key :s
    :mods :LEADER
    :action (a.SplitVertical {:domain :CurrentPaneDomain})}
   {:key :v
    :mods :LEADER
    :action (a.SplitHorizontal {:domain :CurrentPaneDomain})}])

;; External Commands
(local external
  [{:key :g
    :mods :LEADER
    :action (a.SpawnCommandInNewTab {:args [:nu
                                           (.. scripts-dir :lazygit.nu)]})}
   {:key :B
    :mods :LEADER|SHIFT
    :action (a.SpawnCommandInNewTab {:args [:btm]})}
   {:key :Space
    :mods :LEADER
    :action (a.SpawnCommandInNewTab {:args [:nyancat]})}
   {:key :C
    :mods :LEADER
    :action (a.SpawnCommandInNewTab {:args 
                                      [:nu
                                       :-c
                                       "helix ~/Dev/github/Stuff/todos/TODO.md"]})}])

(local keybinds [])
(local keys [basic activate-key-tables tab pane external])

;; Not pretty but works
(each [_ key (ipairs keys)]
  (each [_ v (ipairs key)]
    (table.insert keybinds v)))

keybinds
