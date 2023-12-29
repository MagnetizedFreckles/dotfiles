local M = {}
local wezterm = require("wezterm")

-- Documentation link, idk why
-- https://wezfurlong.org/wezterm/config/fonts.html

-- TODO: Set font size depending on resolution

local monaspace = true

if monaspace == true then
    M.font_size = 12.5
    M.font = wezterm.font_with_fallback({
        {
            family = "MonaspiceNe NF",
            -- NOTE: Ligatures don't work without explicitly enabling them
            harfbuzz_features = {
                -- NOTE: I don't know which ones are enough for correct display
                "calt",
                "liga",
                "dlig",
            },
        },
        "Twemoji",
    })
    M.font_rules = {
        {
            italic = true,
            intensity = "Bold",
            font = wezterm.font({
                family = "MonaspiceRn NF",
                weight = "Bold",
                harfbuzz_features = {
                    "calt",
                    "liga",
                    "dlig",
                },
            }),
        },
        {
            italic = true,
            intensity = "Normal",
            font = wezterm.font({
                family = "MonaspiceRn NF",
                harfbuzz_features = {
                    "calt",
                    "liga",
                    "dlig",
                },
            }),
        },
    }
else
    M.font_size = 13
    M.font = wezterm.font_with_fallback({
        "FiraCode Nerd Font",
        "Twemoji",
    })
    -- TODO: Make Twemoji work with italics
    M.font_rules = {
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
end

return M
