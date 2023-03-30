-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
local opt = vim.opt

-- Making so cursor always stays in the middle of visible screen
map("n", "j", "jzz", { noremap = true, silent = true }) -- :nnoremap j jzz
map("n", "k", "kzz", { noremap = true, silent = true }) -- :nnoremap k kzz
map("v", "j", "jzz", { noremap = true, silent = true }) -- :vnoremap j jzz
map("v", "k", "kzz", { noremap = true, silent = true }) -- :vnoremap k kzz

-- Different spellchecking options
function ToggleSpellCheck()
    if not opt.spell:get() then
        -- Enable spellcheck if it's currently disabled
        opt.spell = true
        opt.spelllang = { "en", "ru" }
        --[[else
        -- Toggle spellchecked langs (gonna do this someday)
        if opt.spelllang == { "en", "ru" } then
            opt.spelllang = { "en", "uk" }
        else
            opt.spelllang = { "en", "ru" }
        end]]
    end
end

-- Map F6 to toggle spellcheck between English/Russian and English/Ukrainian
map("n", "<F6>", ":lua ToggleSpellCheck()<CR>", { noremap = true, silent = true })

-- Map F7 to disable spellcheck completely
map("n", "<F7>", ":set nospell<CR>", { noremap = true, silent = true })
