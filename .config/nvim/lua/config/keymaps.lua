-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap

-- Making so cursor always stays in the middle of visible screen
map("n", "j", "jzz", { noremap = true, silent = true }) -- :nnoremap j jzz
map("n", "k", "kzz", { noremap = true, silent = true }) -- :nnoremap k kzz
map("v", "j", "jzz", { noremap = true, silent = true }) -- :vnoremap j jzz
map("v", "k", "kzz", { noremap = true, silent = true }) -- :vnoremap k kzz
