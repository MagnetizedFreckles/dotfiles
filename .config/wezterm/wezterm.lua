local wezterm = require("wezterm")
local mux = wezterm.mux
local shell = require("config.shell")
local fonts = require("config.fonts")
local keybinds = require("config.keybinds")

local systemstuff = require("utils.systemstuff")
local blur = require("utils.blur")
local opacity = require("config.opacity")

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

-- This is needed for undercurl to work
config.term = "wezterm"

config.scrollback_lines = 10000

--[[
config.unix_domains = {
    {
        name = "unix",
    },
}
]]

-- Tab settings
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true

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

    -- https://wezfurlong.org/wezterm/config/appearance.html#retro-tab-bar-appearance
    tab_bar = {
        background = "#0E1018",
        active_tab = {
            bg_color = "#2b2042",
            fg_color = "#c0c0c0",
            intensity = "Bold",
            underline = "Single", -- "None", "Single" or "Double"
            italic = false,
            strikethrough = false,
        },
        inactive_tab = {
            bg_color = "#1b1032",
            fg_color = "#808080",
        },
        inactive_tab_hover = {
            bg_color = "#3b3052",
            fg_color = "#909090",
            italic = true,
        },
        new_tab = {
            bg_color = "#1b1032",
            fg_color = "#808080",
        },
        new_tab_hover = {
            bg_color = "#3b3052",
            fg_color = "#909090",
            italic = true,
        },
    },
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

-- Enable blur on KDE X11 session
if systemstuff.os_name() == "linux" then
    if systemstuff.windowsystem() == "x11" then
        config.enable_wayland = false
        blur.kde()
    elseif systemstuff.windowsystem() == "wayland" then
        -- I use this instead:
        -- https://github.com/taj-ny/kwin-forceblur
        config.enable_wayland = true
    end
end

config.window_background_opacity = opacity
config.macos_window_background_blur = 20

keybinds.setup(config)
fonts.setup(config)
return config
