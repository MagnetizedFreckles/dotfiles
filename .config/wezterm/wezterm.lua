local wezterm = require("wezterm")
local shell = require("config.shell")
local keybinds = require("config.keybinds")
Os_name = require("utils.os_name")
Blur = require("utils.blur")
Opacity = require("config.opacity")

-- Enable blur on KDE
if Os_name.os_name() == "linux" then
    Blur.linux()
end

local config = {

    default_prog = shell,

    -- Smart tab bar [distraction-free mode]
    hide_tab_bar_if_only_one_tab = true,

    color_scheme = "Argonaut",
    colors = {
        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = "#9399b2",
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = "black",
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = "#9399b2",
    },

    -- Windowing stuff
    initial_cols = 114,
    initial_rows = 32,

    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    window_background_opacity = Opacity,
    macos_window_background_blur = 20,

    -- Font configuration
    -- https://wezfurlong.org/wezterm/config/fonts.html
    font_size = 14.5,

    font = wezterm.font_with_fallback({
        "FiraCode Nerd Font",
        "Twemoji",
    }),

    font_rules = {
        {
            italic = true,
            intensity = "Bold",
            font = wezterm.font({
                family = "Iosevka Nerd Font",
                weight = "Bold",
                style = "Italic",
            }),
        },
        {
            italic = true,
            intensity = "Half",
            font = wezterm.font({
                family = "Iosevka Nerd Font",
                weight = "DemiBold",
                style = "Italic",
            }),
        },
        {
            italic = true,
            intensity = "Normal",
            font = wezterm.font({
                family = "Iosevka Nerd Font",
                style = "Italic",
            }),
        },
    },

    -- Keybinds
    mouse_bindings = keybinds.mouse_bindings,
}

return config
