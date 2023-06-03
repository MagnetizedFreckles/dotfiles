local wezterm = require("wezterm")

return {

    -- Spawn a fish shell in login mode
    default_prog = { "/usr/bin/fish", "-l" } or { "/usr/local/bin/fish", "-l" },

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

    -- Enable blur on KDE
    wezterm.on("window-focus-changed", function()
        os.execute(
            "xdotool search -classname org.wezfurlong.wezterm | xargs -I{} xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id {}"
        )
    end),

    window_background_opacity = 0.85,

    -- Font configuration
    -- https://wezfurlong.org/wezterm/config/fonts.html
    font_size = 15,

    font = wezterm.font_with_fallback({
        "FiraCode Nerd Font",
        "twemoji-ttf",
    }),

    font_rules = {
        {
            intensity = "Bold",
            italic = true,
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

    -- Keymaps
}
