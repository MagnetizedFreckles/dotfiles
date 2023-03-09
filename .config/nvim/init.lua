-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.opt.guifont = { "FiraCode Nerd Font", "h15" } -- text below applies for VimScript
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
