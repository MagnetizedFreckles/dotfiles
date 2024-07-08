local wezterm = require("wezterm")

-- Documentation link, why not
-- https://wezfurlong.org/wezterm/config/fonts.html

-- TODO: Set font size depending on resolution

local Fonts = {}
function Fonts.setup(config)
    config.warn_about_missing_glyphs = false

    -- Just a simple switch since I don't need more
    local monaspace = false

    if monaspace == true then
        config.font_size = 12
        config.font = wezterm.font_with_fallback({
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
        config.font_rules = {
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
        config.font_size = 12
        config.font = wezterm.font_with_fallback({
            "FiraCode Nerd Font",
            "Twemoji",
        })
        config.font_rules = {
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
end

return Fonts
