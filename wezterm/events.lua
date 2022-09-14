local w = require"wezterm"
local a = w.action

local M = {}

function M.register()
  -- Broot toggle
  -- inspired by Nerd tree
  w.on("broot-toggle", function(win,pane)
    local is_broot_exist = false
    local pane_index = 1
    -- get all pane on window
    local pane_list = win:mux_window():tabs()[1]:panes()

    -- iterate all pane, if there is pane with title broot 
    -- set is_broot_exist to true
    for k,v in pairs(pane_list) do
      if v:get_title() == "broot" then
        is_broot_exist = true
        pane_index = k
      end
    end

    -- check if broot already exist on window
    if is_broot_exist then
      -- if exist activate pane where broot exist
      -- then close it without confirmation
      win:perform_action(
        a.Multiple {
          a.ActivatePaneByIndex(pane_index - 1),
          a.CloseCurrentPane { confirm = false }
        },
        pane
      )
    else
      -- otherwise spawn new instance of broot in left side of window
      win:perform_action(
        a.SplitPane {
          direction = "Left",
          command = { args = {"nu", "-c", "broot"}},
          size = { Percent = 20 }
        },
        pane
      )
    end
  end)

  w.on("maximize_window", function(win, _)
    local window_size = win:get_dimensions().pixel_width
    if window_size == 1366  then
      win:restore()
    else
      win:maximize()
    end
  end)
end

return M
