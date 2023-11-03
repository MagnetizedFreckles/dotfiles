-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Two spaces is a Nix-lang convention
vim.api.nvim_create_autocmd("FileType", {
    pattern = "nix",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end,
})

-- Adding keymap for converting markdown to html with pandoc
function PandocMdHtml()
    local filename = vim.fn.expand("%:p")
    local output_filename = vim.fn.fnamemodify(filename, ":r") .. ".html"

    local pandoc_command = string.format("pandoc --from commonmark_x %s -s -o %s --katex", filename, output_filename)
    vim.fn.system(pandoc_command)
    vim.api.nvim_out_write("Converted .md to .html\n")
end
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.api.nvim_set_keymap(
            "n",
            "<leader>cb",
            ":lua PandocMdHtml()<CR>",
            { noremap = true, silent = true, desc = "Convert Markdown document to html" }
        )
    end,
})
