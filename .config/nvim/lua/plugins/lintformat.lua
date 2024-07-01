-- So I want to disable markdown-related linting and formatting since I don't really need these
local M = {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                ["markdown"] = {},
                ["markdown.mdx"] = {},
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        optional = true,
        opts = {
            linters_by_ft = {
                markdown = {},
            },
        },
    },
}

return M
