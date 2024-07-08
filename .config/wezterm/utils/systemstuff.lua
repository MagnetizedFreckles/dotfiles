local wezterm = require("wezterm")

local M = {}

function M.os_name()
    if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
        return "macos"
    elseif
        wezterm.target_triple == "x86_64-unknown-linux-gnu" or wezterm.target_triple == "aarch64-unknown-linux-gnu"
    then
        return "linux"
    else
        return "windows"
    end
end

function M.windowsystem()
    local handle = io.popen("loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type")
    if handle then
        local result = handle:read("*a")
        handle:close()

        if result then
            if string.find(result, "Type=wayland") then
                return "wayland"
            elseif string.find(result, "Type=x11") then
                return "x11"
            else
                return "error lol"
            end
        else
            return "error lol"
        end
    else
        return "error lol"
    end
end

return M
