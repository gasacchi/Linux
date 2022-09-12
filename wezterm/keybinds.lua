local w = require "wezterm"
local a = w.action

-- Keybinds related to UI view
local ui = {
  { -- Decrease font size
    key = "-",
    mods = "LEADER",
    action = a.DecreaseFontSize,
  },
  { -- Increase font size
    key = "+",
    mods = "LEADER|SHIFT",
    action = a.IncreaseFontSize,
  },
  { -- Toggle full screen
    key = "F",
    mods = "LEADER|SHIFT",
    action = a.ToggleFullScreen
  },
  { -- Show command launcher
    key = "c",
    mods = "LEADER",
    action = a.ShowLauncher
  },
  { -- Show debug REPL
    key = ",",
    mods = "LEADER",
    action = a.ShowDebugOverlay
  },
}

-- Tab control keybinds
local tab = {
  { -- Spawn New tab
    key = "t",
    mods = "LEADER",
    action = a.SpawnTab "CurrentPaneDomain",
  },
  { -- Show tab navigator
    key = "Tab",
    mods = "LEADER",
    action = a.ShowTabNavigator,
  },
  { -- Goto next tab
    key = "n",
    mods = "LEADER",
    action = a.ActivateTabRelative(1),
  },
  { -- Goto prev tab
    key = "p",
    mods = "LEADER",
    action = a.ActivateTabRelative(-1),
  },
  { -- Delete tab
    key = "D",
    mods = "LEADER|SHIFT",
    action = a.CloseCurrentTab { confirm = true },
  },
}

-- Pane control keybinds
local pane = {
  { -- Focus to left pane
    key = "h",
    mods = "LEADER",
    action = a.ActivatePaneDirection "Left"
  },
  { -- Focus to right pane
    key = "l",
    mods = "LEADER",
    action = a.ActivatePaneDirection "Right"
  },
  { -- Focus to pane below
    key = "j",
    mods = "LEADER",
    action = a.ActivatePaneDirection "Down"
  },
  { -- Focus on pane above
    key = "k",
    mods = "LEADER",
    action = a.ActivatePaneDirection "Up"
  },
  { -- Resize pane size to left direction
    key = "H",
    mods = "LEADER|SHIFT",
    action = a.AdjustPaneSize { "Left", 5 }
  },
  { -- Resize pane size to right direction
    key = "L",
    mods = "LEADER|SHIFT",
    action = a.AdjustPaneSize { "Right", 5 }
  },
  { -- Resize pane size to below direction
    key = "J",
    mods = "LEADER|SHIFT",
    action = a.AdjustPaneSize { "Down", 5 }
  },
  { -- Resize pane size to above direction
    key = "K",
    mods = "LEADER|SHIFT",
    action = a.AdjustPaneSize { "Up", 5 }
  },
  { -- Show pane selection
    key = "w",
    mods = "LEADER",
    action = a.PaneSelect {
      alphabet = "aoeusnth"
    }
  },
  { -- Show pane selection and swap selected pane to current active pane
    key = "W",
    mods = "LEADER|SHIFT",
    action = a.PaneSelect {
      mode = "SwapWithActive"
    }
  },
  { -- Delete current pane
    key = "d",
    mods = "LEADER",
    action = a.CloseCurrentPane { confirm = true }
  },
  { -- Split current pane to below
    key = "s",
    mods = "LEADER",
    action = a.SplitVertical { domain = "CurrentPaneDomain" }
  },
  { -- Split current pane to right
    key = "v",
    mods = "LEADER",
    action = a.SplitHorizontal { domain = "CurrentPaneDomain" }
  },
  { -- Zoom current pane
    key = "f",
    mods = "LEADER",
    action = a.TogglePaneZoomState
  },
}

-- External Commands
local external = {
  { -- Spawn gitui in new tab
    key = "g",
    mods = "LEADER",
    action = a.SpawnCommandInNewTab {
      -- args = { "gitui" },
      args = { "nu", "/home/gasacchi/Dev/github/Linux/Scripts/wezterm-gitui.nu" },
    }
  },
  { -- Spawn btm (system monitor) in new tab
    key = "b",
    mods = "LEADER",
    action = a.SpawnCommandInNewTab {
      args = { "btm" },
    }
  },
  { -- Spawn nyancat to new tab
    key = "Space",
    mods = "LEADER",
    action = a.SpawnCommandInNewTab {
      args = { "nyancat" },
    }
  },
  { -- Span btm with todo list
    key = "C",
    mods = "LEADER",
    action = a.SpawnCommandInNewTab {
      -- args = { "broot", "/home/gasacchi/Dev/github/Stuff/todos" },
      args = { "nu", "/home/gasacchi/Dev/github/Linux/Scripts/wezterm-broot-todos.nu" },
    }
  },
}

local keybinds = {}

-- Not pretty but works
for _,key in ipairs({ui,tab,pane,external}) do
  for _,v in ipairs(key) do
    table.insert(keybinds, v)
  end
end


return keybinds

