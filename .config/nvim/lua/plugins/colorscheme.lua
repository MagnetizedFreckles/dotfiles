return {
    -- add catppuccin
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            transparent_background = true,
        },
    },
    -- Configure LazyVim to load catppuccin
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
            --[[
            require("notify").setup({
                background_colour = "#000000",
            }),
            ]]
        },
    },
}
