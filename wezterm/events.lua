-- Custom wezterm event
local wez = require("wezterm")


local function toggle_maximize_window_fn(window, _)
  local window_height = window:get_dimensions().pixel_height
  -- local is_fullscreen = window:get_dimensions().is_fullscreen
  if (window_height < 744) then
    return window:maximize()
  else
    return window:restore()
  end
end

local function register()
  wez.on("toggle_maximize_window", toggle_maximize_window_fn)
end
return {register = register}
