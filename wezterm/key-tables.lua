-- Key tables
local wez = require 'wezterm'
local act = wez.action

local M = {}

M.copy_mode = {
  { key = 'h', mods = 'NONE', action = act.CopyMode('MoveLeft') },
  { key = 'l', mods = 'NONE', action = act.CopyMode('MoveRight') },
  { key = 'j', mods = 'NONE', action = act.CopyMode('MoveDown') },
  { key = 'k', mods = 'NONE', action = act.CopyMode('MoveUp') },
  { key = 'g',
    mods = 'NONE',
    action = act.CopyMode('MoveToScrollbackTop')
  },
  { key = 'e',
    mods = 'NONE',
    action = act.CopyMode('MoveToScrollbackBottom')
  },
  { key = 'u', mods = 'NONE', action = act.CopyMode('PageUp') },
  { key = 'd', mods = 'NONE', action = act.CopyMode('PageDown') },
  { key = 'w', mods = 'NONE', action = act.CopyMode('MoveForwardWord') },
  { key = 'b', mods = 'NONE', action = act.CopyMode('MoveBackwardWord') },
  { key = 'h', mods = 'CTRL', action = act.CopyMode('MoveToStartOfLine') },
  { key = 'l',
    mods = 'CTRL',
    action = act.CopyMode('MoveToEndOfLineContent')
  },
  { key = 'o',
    mods = 'SHIFT',
    action = act.CopyMode('MoveToStartOfNextLine')
  },
  { key = 'c', mods = 'CTRL', action = act.CopyMode('Close') },
  { key = 's',
    mods = 'CTRL',
    action = act.CopyMode('MoveToStartOfLineContent')
  },
  { key = 'Tab',
    mods = 'NONE',
    action = act.CopyMode('MoveToSelectionOtherEnd')
  },
  { key = 'Escape', mods = 'NONE', action = act.CopyMode('Close') },
  { key = 'v',
    mods = 'NONE',
    action = act.CopyMode { SetSelectionMode = 'Cell' }
  },
  { key = 'v',
    mods = 'CTRL',
    action = act.CopyMode { SetSelectionMode = 'Block' }
  },
  { key = 'x',
    mods = 'NONE',
    action = act.CopyMode { SetSelectionMode = 'Line' }
  },
  { key = 'y',
    mods = 'NONE',
    action = act.Multiple {
      { CopyTo = 'Clipboard' },
      { CopyMode = 'Close' }
    }
  }
}

M.search_mode = {
  { key = 'c', mods = 'CTRL', action = act.CopyMode('Close') },
  { key = 'n', mods = 'CTRL', action = act.CopyMode('NextMatch') },
  { key = 'p', mods = 'CTRL', action = act.CopyMode('PriorMatch') },
  { key = 's', mods = 'CTRL', action = act.CopyMode('CycleMatchType') },
  { key = 'r', mods = 'CTRL', action = act.CopyMode('ClearPattern') },
  { key = 'u', mods = 'CTRL', action = act.CopyMode('PriorMatchPage') },
  { key = 'd', mods = 'CTRL', action = act.CopyMode('NextMatchPage') },
}

M.resize_pane_mode = {
  { key = 'h', mods = 'NONE', action = act.AdjustPaneSize { 'Left', 2 } },
  { key = 'l', mods = 'NONE', action = act.AdjustPaneSize { 'Right', 2 } },
  { key = 'j', mods = 'NONE', action = act.AdjustPaneSize { 'Down', 2 } },
  { key = 'k', mods = 'NONE', action = act.AdjustPaneSize { 'Up', 2 } },
  { key = 'c', mods = 'CTRL', action = 'PopKeyTable' },
  { key = 'Enter', mods = 'NONE', action = 'PopKeyTable' },
}

M.scroll_mode = {
  { key = 'j', mods = 'NONE', action = act.ScrollByPage(1) },
  { key = 'k', mods = 'NONE', action = act.ScrollByPage(-1) },
  { key = 'c', mods = 'CTRL', action = 'PopKeyTable' },
  { key = 'Enter', mods = 'NONE', action = 'PopKeyTable' },
}

M.font_size_mode = {
  { key = 'j', mods = 'NONE', action = act.DecreaseFontSize },
  { key = 'k', mods = 'NONE', action = act.IncreaseFontSize },
  { key = 'r', mods = 'NONE', action = act.ResetFontSize },
  { key = 'c', mods = 'CTRL', action = 'PopKeyTable' },
  { key = 'Enter', mods = 'NONE', action = 'PopKeyTable' },
}


return M
