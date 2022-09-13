local w = require "wezterm"
local a = w.action

-- Keybinds related to basic functionality
local basic = {
  { key = "R", mods = "LEADER|SHIFT", action = a.ReloadConfiguration },
  { key = "c", mods = "CTRL|SHIFT", action = a.CopyTo "Clipboard", },
  { key = "v", mods = "CTRL|SHIFT", action = a.PasteFrom "Clipboard", },
  { key = "-", mods = "LEADER", action = a.DecreaseFontSize, },
  { key = "+", mods = "LEADER|SHIFT", action = a.IncreaseFontSize, },
  { key = "=", mods = "LEADER", action = a.ResetFontSize, },
  { key = "z", mods = "LEADER|SHIFT", action = a.ToggleFullScreen },
  { key = "c", mods = "LEADER", action = a.ShowLauncher },
  { key = ",", mods = "LEADER", action = a.ShowDebugOverlay },
  { key = ".", mods = "LEADER", action = a.Search { CaseSensitiveString = "" } }
}

local activate_key_tables = {
  { key = "S", mods = "LEADER|SHIFT", action = a.Search { CaseSensitiveString = "" } },
  {
    key = ".",
    mods = "LEADER",
    action = a.ActivateCopyMode
  },
  {
    key = "r",
    mods = "LEADER",
    action = a.ActivateKeyTable {
      name = "resize_pane_mode",
      one_shot = false
    }
  },
  {
    key = "F",
    mods = "LEADER|SHIFT",
    action = a.ActivateKeyTable {
      name = "font_size_mode",
      one_shot = false
    }
  },
}

-- Tab control keybinds
local tab = {
  { key = "1", mods = "LEADER", action = a.ActivateTab(0), },
  { key = "2", mods = "LEADER", action = a.ActivateTab(1), },
  { key = "3", mods = "LEADER", action = a.ActivateTab(2), },
  { key = "4", mods = "LEADER", action = a.ActivateTab(3), },
  { key = "5", mods = "LEADER", action = a.ActivateTab(4), },
  { key = "t", mods = "LEADER", action = a.SpawnTab "CurrentPaneDomain", },
  { key = "Tab", mods = "LEADER", action = a.ShowTabNavigator, },
  { key = "n", mods = "LEADER", action = a.ActivateTabRelative(1), },
  { key = "p", mods = "LEADER", action = a.ActivateTabRelative(-1), },
  {
    key = "D",
    mods = "LEADER|SHIFT",
    action = a.CloseCurrentTab {
      confirm = true
    },
  },
}

-- Pane control keybinds
local pane = {
  { key = "h", mods = "LEADER", action = a.ActivatePaneDirection "Left" },
  { key = "l", mods = "LEADER", action = a.ActivatePaneDirection "Right" },
  { key = "j", mods = "LEADER", action = a.ActivatePaneDirection "Down" },
  { key = "k", mods = "LEADER", action = a.ActivatePaneDirection "Up" },
  { key = "f", mods = "LEADER", action = a.TogglePaneZoomState },
  {
    key = "w",
    mods = "LEADER",
    action = a.PaneSelect {
      alphabet = "aoeusnth"
    }
  },
  {
    key = "W",
    mods = "LEADER|SHIFT",
    action = a.PaneSelect {
      mode = "SwapWithActive"
    }
  },
  {
    key = "d",
    mods = "LEADER",
    action = a.CloseCurrentPane {
      confirm = true
    }
  },
  {
    key = "s",
    mods = "LEADER",
    action = a.SplitVertical {
      domain = "CurrentPaneDomain"
    }
  },
  {
    key = "v",
    mods = "LEADER",
    action = a.SplitHorizontal {
      domain = "CurrentPaneDomain"
    }
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
for _, key in ipairs({ basic, activate_key_tables, tab, pane, external }) do
  for _, v in ipairs(key) do
    table.insert(keybinds, v)
  end
end


return keybinds
