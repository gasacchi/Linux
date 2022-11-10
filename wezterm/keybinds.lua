-- keybindings
local wez = require 'wezterm'
local act = wez.action

local basic =
{ { key = 'q', mods = 'LEADER', action = act.QuitApplication },
  { key = 'R', mods = 'LEADER|SHIFT', action = act.ReloadConfiguration },
  { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
  { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
  { key = 'z', mods = 'LEADER', action = act.ToggleFullScreen },
  { key = 'c', mods = 'LEADER', action = act.ShowLauncher },
  { key = 'm',
    mods = 'LEADER',
    action = act.EmitEvent('toggle_maximize_window')
  },
  { key = ',', mods = 'LEADER', action = act.ShowDebugOverlay },
  { key = '.',
    mods = 'LEADER',
    action = act.Search { CaseSensitiveString = '' }
  }
}

--  Activate key tables
local activate_key_tables =
{ { key = 'S',
  mods = 'LEADER|SHIFT',
  action = act.Search { CaseSensitiveString = '' } },
  { key = ".", mods = 'LEADER', action = act.ActivateCopyMode },
  { key = 's',
    mods = 'LEADER|CTRL',
    action = act.ActivateKeyTable {
      name = 'scroll_mode ',
      one_shot = false
    }
  },
  { key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'resize_pane_mode',
      one_shot = false
    }
  },
  { key = 'F',
    mods   = 'LEADER|SHIFT',
    action = act.ActivateKeyTable {
      name = 'font_size_mode',
      one_shot = false
    }
  }
}

--  Tab control keybinds
local tab =
{ { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
  { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
  { key = 't', mods = 'LEADER', action = act.SpawnTab('DefaultDomain') },
  { key = 'Tab', mods = 'LEADER', action = act.ShowTabNavigator },
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'D',
    mods   = 'LEADER|SHIFT',
    action = act.CloseCurrentTab { confirm = true }
  }
}

-- Pane control keybinds
local pane = {
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection('Left') },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection('Right') },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection('Down') },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection('Up') },
  { key = 'f', mods = 'LEADER', action = act.TogglePaneZoomState },
  { key = 'w',
    mods   = 'LEADER',
    action = act.PaneSelect { alphabet = 'aoeusnth' }
  },
  { key = 'W',
    mods = 'LEADER|SHIFT',
    action = act.PaneSelect { mode = 'SwapWithActive' }
  },
  { key = 'd',
    mods = 'LEADER',
    action = act.CloseCurrentPane { confirm = true }
  },
  { key = 's',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  { key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
  }
}

-- ;; External Commands
local external = {
  { key = 'g',
    mods   = 'LEADER',
    action = act.SpawnCommandInNewTab { args = { 'fish', '-C', 'gitui' } }
  },
  { key = 'B',
    mods   = 'LEADER|SHIFT',
    action = act.SpawnCommandInNewTab { args = { 'btm' } }
  },
  { key = 'Space',
    mods   = 'LEADER',
    action = act.SpawnCommandInNewTab { args = { 'nyancat' } }
  },
  { key = 'C',
    mods   = 'LEADER',
    action = act.SpawnCommandInNewTab {
      args = { 'fish', '-c', 'hx ~/Dev/github/Stuff/todos/TODO.md' }
    }
  }
}

local M    = {}
local keys = { basic, activate_key_tables, tab, pane, external }

for _, key in ipairs(keys) do
  for _, v in ipairs(key) do
    table.insert(M, v)
  end
end

return M
