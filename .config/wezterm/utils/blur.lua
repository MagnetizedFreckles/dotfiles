local wezterm = require("wezterm")

local M = {}

-- This only works on KDE X11 session
function M.kde()
    wezterm.on("window-focus-changed", function()
        os.execute(
            "xdotool search -classname org.wezfurlong.wezterm | xargs -I{} xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id {}"
        )
    end)
end

return M
