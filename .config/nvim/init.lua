-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.opt.guifont = { "FiraCode Nerd Font", "h15" }
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_animation_length = 0.05
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_transparency = 0.9
    -- vim.g.neovide_background_color = "#0e1019"
end
