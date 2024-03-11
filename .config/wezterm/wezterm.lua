local wezterm = require("wezterm")
local mux = wezterm.mux
local shell = require("config.shell")
local fonts = require("config.fonts")
local keybinds = require("config.keybinds")

local systemstuff = require("utils.systemstuff")
local blur = require("utils.blur")
local opacity = require("config.opacity")

--HOME = os.getenv("HOME")

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

-- Font configuration
config.font_size = fonts.font_size
config.font = fonts.font
config.font_rules = fonts.font_rules
config.warn_about_missing_glyphs = false

-- Keybinds
config.mouse_bindings = keybinds.mouse_bindings

return config
