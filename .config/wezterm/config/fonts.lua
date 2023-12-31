local M = {}
local wezterm = require("wezterm")

-- Documentation link, idk why
-- https://wezfurlong.org/wezterm/config/fonts.html

-- TODO: Set font size depending on resolution

-- Just a simple switch cuz I don't need more
local monaspace = true

if monaspace == true then
    M.font_size = 12
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
            intensity = "Normal",
            font = wezterm.font_with_fallback({
                {
                    family = "MonaspiceRn NF",
                    harfbuzz_features = {
                        "calt",
                        "liga",
                        "dlig",
                    },
                },
                {
                    family = "Twemoji",
                    weight = "Regular",
                },
            }),
        },
        {
            italic = true,
            intensity = "Bold",
            font = wezterm.font_with_fallback({
                {
                    family = "MonaspiceRn NF",
                    weight = "Bold",
                    harfbuzz_features = {
                        "calt",
                        "liga",
                        "dlig",
                    },
                },
                {
                    family = "Twemoji",
                    weight = "Regular",
                },
            }),
        },
        {
            italic = true,
            intensity = "Half",
            font = wezterm.font_with_fallback({
                {
                    family = "MonaspiceRn NF",
                    weight = "Light",
                    harfbuzz_features = {
                        "calt",
                        "liga",
                        "dlig",
                    },
                },
                {
                    family = "Twemoji",
                    weight = "Regular",
                },
            }),
        },
    }
else
    M.font_size = 12
    M.font = wezterm.font_with_fallback({
        "FiraCode Nerd Font",
        "Twemoji",
    })
    M.font_rules = {
        {
            italic = true,
            intensity = "Bold",
            font = wezterm.font_with_fallback({
                {
                    family = "Iosevka NF",
                    weight = "Bold",
                    style = "Italic",
                },
                {
                    family = "Twemoji",
                    weight = "Regular",
                },
            }),
        },
        {
            italic = true,
            intensity = "Half",
            font = wezterm.font_with_fallback({
                {
                    family = "Iosevka NF",
                    weight = "DemiBold",
                    style = "Italic",
                },
                {
                    family = "Twemoji",
                    weight = "Regular",
                },
            }),
        },
        {
            italic = true,
            intensity = "Normal",
            font = wezterm.font_with_fallback({
                {
                    family = "Iosevka NF",
                    style = "Italic",
                },
                {
                    family = "Twemoji",
                    weight = "Regular",
                },
            }),
        },
    }
end

return M
