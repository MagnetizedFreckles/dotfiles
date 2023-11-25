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

-- So, everything below is to convert .md files to .html
-- on every filesave, but only if certain keybind was pressed
--
-- Define the file conversion process
-- TODO: Change how and when notifications are shown
function PandocMdHtml()
    local filename = vim.fn.expand("%:p")
    local output_filename = vim.fn.fnamemodify(filename, ":r") .. ".html"

    local pandoc_command = string.format(
        "pandoc --from commonmark_x %s -s -o %s --katex --metadata-file=markdown.yaml",
        filename,
        output_filename
    )
    vim.fn.system(pandoc_command)
    vim.api.nvim_out_write("Converted!\n")
end
-- Make it convert on every filesave
function ConvertOnSave()
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.md",
        command = "lua PandocMdHtml()",
    })
end
-- Define a keybind to enable autoconversion
-- TODO: Make it both enable and disable autoconversion,
-- depending on current state
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.api.nvim_set_keymap(
            "n",
            "<leader>cb",
            ":lua ConvertOnSave()<CR>",
            { noremap = true, silent = true, desc = "Convert md to html" }
        )
    end,
})
