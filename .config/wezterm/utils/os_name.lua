local wezterm = require("wezterm")

local M = {}

function M.os_name()
    if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
        return "macos"
    elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
        return "linux"
    else
        return "windows"
    end
end

return M
