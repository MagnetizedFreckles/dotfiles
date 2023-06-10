local M = {}
local wezterm = require("wezterm")
local act = wezterm.action

M.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL|SHIFT",
        action = "OpenLinkAtMouseCursor",
    },
}

return M
