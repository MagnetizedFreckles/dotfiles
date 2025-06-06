return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = "BufReadPost",
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Schrink selection", mode = "x" },
        },
        ---@type TSConfig
        opts = {
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            ensure_installed = {
                "bash",
                "fish",
                "html",
                "json",
                "latex",
                "lua",
                "markdown",
                "markdown_inline",
                "nix",
                "python",
                "query",
                "regex",
                "rust",
                "tsx",
                "vim",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<nop>",
                    node_decremental = "<bs>",
                },
            },
        },
        ---@param opts TSConfig
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
