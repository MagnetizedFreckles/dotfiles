---@diagnostic disable
local xplr = xplr
version = "0.21.1"
---@diagnostic disable

local home = os.getenv("HOME")

-- My options

-- Enable mouse scrolling by default
xplr.config.general.enable_mouse = true

-- Change how "modified" column is rendered
xplr.fn.builtin.fmt_general_table_row_cols_4 = function(m)
    -- Default, for reference
    --return tostring(os.date("%a %b %d %H:%M:%S %Y", m.last_modified / 1000000000))
    return tostring(os.date("%y-%m-%d %H:%M:%S", m.last_modified / 1000000000))
end

-- Slightly updating default layout
xplr.config.layouts.builtin.default = {
    Horizontal = {
        config = {
            constraints = {
                { Percentage = 75 },
                { Percentage = 25 },
            },
        },
        splits = {
            {
                Vertical = {
                    config = {
                        constraints = {
                            { Length = 3 },
                            { Min = 1 },
                            { Length = 3 },
                        },
                    },
                    splits = {
                        "SortAndFilter",
                        "Table",
                        "InputAndLogs",
                    },
                },
            },
            {
                Vertical = {
                    config = {
                        constraints = {
                            { Percentage = 30 },
                            { Percentage = 70 },
                        },
                    },
                    splits = {
                        "Selection",
                        "HelpMenu",
                    },
                },
            },
        },
    },
}

-- Plugins
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path .. ";" .. xpm_path .. "/?.lua;" .. xpm_path .. "/?/init.lua"

os.execute(string.format("[ -e '%s' ] || git clone '%s' '%s'", xpm_path, xpm_url, xpm_path))

require("xpm").setup({
    auto_install = true,
    auto_cleanup = true,
    plugins = {
        -- Let xpm manage itself
        "dtomvan/xpm.xplr",

        "sayanarijit/trash-cli.xplr",

        "sayanarijit/dua-cli.xplr",

        -- Dual-paneled navigation
        --"sayanarijit/dual-pane.xplr",
        -- ctrl-w + h / ctrl-h + left / ctrl-left to activate the left pane.
        -- ctrl-w + l / ctrl-l + right / ctrl-right to activate the right pane.
        -- ctrl-w + w / ctrl-w toggle active pane.
        -- ctrl-w + q / ctrl-q quit active pane.

        -- Ranger-like three pane layout support
        {
            name = "sayanarijit/tri-pane.xplr",
            setup = function()
                require("tri-pane").setup({
                    layout_key = "T", -- In switch_layout mode
                    as_default_layout = false, -- Switch by pressing 'Ctrl-W'+'T'
                    left_pane_width = { Percentage = 20 },
                    middle_pane_width = { Percentage = 50 },
                    right_pane_width = { Percentage = 30 },
                    left_pane_renderer = custom_function_to_render_left_pane,
                    right_pane_renderer = custom_function_to_render_right_pane,
                })
            end,
        },

        -- web-devicons for xplr
        "gitlab:hartan/web-devicons.xplr",
        {
            name = "sayanarijit/fzf.xplr",
            setup = function()
                require("fzf").setup({
                    mode = "default",
                    key = "ctrl-f",
                    bin = "fzf",
                    args = "--preview 'pistol {}'",
                    recursive = true, -- If true, search all files under $PWD
                    enter_dir = false, -- Enter if the result is directory
                })
            end,
        },

        -- File viewer and opener
        -- TODO: Make all this work
        "Junker/nuke.xplr",
        {
            name = "Junker/nuke.xplr",
            setup = function()
                require("nuke").setup({
                    pager = "less -R",
                    open = {
                        run_executables = false,
                        custom = {
                            { extension = "jpg", command = "feh {}" },
                            { mime = "video/mp4", command = "mpv {}" },
                            { mime_regex = "^video/.*", command = "mpv {}" },
                            { mime_regex = ".*", command = "xdg-open {}" },
                        },
                    },
                    view = {
                        show_line_numbers = true, -- default: false
                    },
                    smart_view = {
                        custom = {
                            { extension = "so", command = "ldd -r {} | less" },
                        },
                    },
                })

                local key = xplr.config.modes.builtin.default.key_bindings.on_key

                key.v = {
                    help = "nuke",
                    messages = { "PopMode", { SwitchModeCustom = "nuke" } },
                }
            end,
        },
    },
})
