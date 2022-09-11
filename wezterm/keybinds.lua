local w = require "wezterm"

return {
  -- Font
  {
    key = "-",
    mods = "LEADER",
    action = w.action.DecreaseFontSize,
  },
  {
    key = "+",
    mods = "LEADER|SHIFT",
    action = w.action.IncreaseFontSize,
  },
  -- TAB
  {
    key = "t",
    mods = "LEADER",
    action = w.action.SpawnTab "CurrentPaneDomain",
  },
  {
    key = "Tab",
    mods = "LEADER",
    action = w.action.ShowTabNavigator,
  },
  {
    key = "n",
    mods = "LEADER",
    action = w.action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "LEADER",
    action = w.action.ActivateTabRelative(-1),
  },
  {
    key = "D",
    mods = "LEADER|SHIFT",
    action = w.action.CloseCurrentTab { confirm = true },
  },
  -- PANE
  {
    key = "h",
    mods = "LEADER",
    action = w.action.ActivatePaneDirection "Left"
  },
  {
    key = "l",
    mods = "LEADER",
    action = w.action.ActivatePaneDirection "Right"
  },
  {
    key = "j",
    mods = "LEADER",
    action = w.action.ActivatePaneDirection "Down"
  },
  {
    key = "k",
    mods = "LEADER",
    action = w.action.ActivatePaneDirection "Up"
  },
  {
    key = "H",
    mods = "LEADER|SHIFT",
    action = w.action.AdjustPaneSize { "Left", 5 }
  },
  {
    key = "L",
    mods = "LEADER|SHIFT",
    action = w.action.AdjustPaneSize { "Right", 5 }
  },
  {
    key = "J",
    mods = "LEADER|SHIFT",
    action = w.action.AdjustPaneSize { "Down", 5 }
  },
  {
    key = "K",
    mods = "LEADER|SHIFT",
    action = w.action.AdjustPaneSize { "Up", 5 }
  },
  {
    key = "w",
    mods = "LEADER",
    action = w.action.PaneSelect {
      alphabet = "aoeusnth"
    }
  },
  {
    key = "W",
    mods = "LEADER|SHIFT",
    action = w.action.PaneSelect {
      mode = "SwapWithActive"
    }
  },
  {
    key = "d",
    mods = "LEADER",
    action = w.action.CloseCurrentPane { confirm = true }
  },
  {
    key = "s",
    mods = "LEADER",
    action = w.action.SplitVertical { domain = "CurrentPaneDomain" }
  },
  {
    key = "v",
    mods = "LEADER",
    action = w.action.SplitHorizontal { domain = "CurrentPaneDomain" }
  },
  {
    key = "f",
    mods = "LEADER",
    action = w.action.TogglePaneZoomState
  },
  {
    key = "F",
    mods = "LEADER|SHIFT",
    action = w.action.ToggleFullScreen
  },
  {
    key = "L",
    mods = "LEADER|SHIFT",
    action = w.action.ShowDebugOverlay
  },
}
