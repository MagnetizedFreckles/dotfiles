return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        dependencies = { "mason.nvim" },
        opts = function()
            local nls = require("null-ls")
            return {
                sources = {
                    -- nls.builtins.formatting.prettierd,
                    nls.builtins.formatting.stylua, -- Lua formatting
                    -- nls.builtins.diagnostics.ruff, -- Python diagnostics, better install ruff-lsp instead
                    -- nls.builtins.diagnostics.markdownlint, -- Markdown diagnostics
                    nls.builtins.formatting.rustfmt, -- Rust formatting
                },
            }
        end,
    },
}
