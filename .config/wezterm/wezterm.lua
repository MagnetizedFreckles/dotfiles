local wezterm = require("wezterm")
local mux = wezterm.mux
local shell = require("config.shell")
local keybinds = require("config.keybinds")
Os_name = require("utils.os_name")
Blur = require("utils.blur")
Opacity = require("config.opacity")

--HOME = os.getenv("HOME")

-- Enable blur on KDE
if Os_name.os_name() == "linux" then
    Blur.linux()
end

-- Maximize and focus *first spawned* windows
wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window({})
    window:gui_window():maximize()
    window:gui_window():focus()
end)

wezterm.GLOBALS = wezterm.GLOBALS or {}
wezterm.GLOBALS.seen_windows = wezterm.GLOBALS.seen_windows or {}

-- Maximize and focus every other spawned window
-- (idk why this isn't documented, I was lucky to find in someone's config)
wezterm.on("window-config-reloaded", function(window)
    local id = window:window_id()

    local is_new_window = not wezterm.GLOBALS.seen_windows[id]
    wezterm.GLOBALS.seen_windows[id] = true

    if is_new_window then
        window:maximize()
        window:focus()
    end
end)

-- Allow working with both the current release and the nightly
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_prog = shell

-- Smart tab bar [distraction-free mode]
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Argonaut"
config.colors = {
    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = "#9399b2",
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = "black",
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = "#9399b2",
}

-- Windowing stuff
config.initial_cols = 114
config.initial_rows = 32
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.window_background_opacity = Opacity
config.macos_window_background_blur = 20

-- Font configuration
-- https://wezfurlong.org/wezterm/config/fonts.html
config.font_size = 13

config.font = wezterm.font_with_fallback({
    "FiraCode Nerd Font",
    "Twemoji",
})

-- TODO: Make Twemoji work with italics
config.font_rules = {
    {
        italic = true,
        intensity = "Bold",
        font = wezterm.font({
            family = "Iosevka NF",
            weight = "Bold",
            style = "Italic",
        }),
    },
    {
        italic = true,
        intensity = "Half",
        font = wezterm.font({
            family = "Iosevka NF",
            weight = "DemiBold",
            style = "Italic",
        }),
    },
    {
        italic = true,
        intensity = "Normal",
        font = wezterm.font({
            family = "Iosevka NF",
            style = "Italic",
        }),
    },
}

-- Keybinds
config.mouse_bindings = keybinds.mouse_bindings

return config
