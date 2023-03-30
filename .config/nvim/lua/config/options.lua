-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-----------------------------------------------------------
-- For conciseness
-----------------------------------------------------------
local opt = vim.opt

-- Text formatting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = false
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true
opt.smartindent = true

-----------------------------------------------------------
-- Text appearance
-----------------------------------------------------------
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·" } -- Middle dot for trailing spaces and triangle for tabulations (eol = "↲", )
opt.wrap = true -- Line wrapping
opt.linebreak = true -- Word wrapping (so words won't divide in half when line wraps)
opt.breakindent = true -- Indent wrapped lines
opt.spell = true
opt.spelllang = { "en", "ru" } -- English/Russian as default spellchecked languages

-----------------------------------------------------------
-- Editing comfort
-----------------------------------------------------------
opt.cursorline = true -- Enable highlighting of the current line
opt.number = true
opt.relativenumber = true -- Enable hybrid line numbers
opt.mouse = "a" -- Enable mouse
opt.clipboard = "unnamedplus" -- For system clipboard
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.whichwrap:append("<>[]hl") -- When cursor reaches end/beginning of line
opt.splitbelow = true
opt.splitright = true -- Window split
vim.g.mapleader = " " -- Mapping leader key
vim.g.maplocalleader = " " -- Mapping local leader key
opt.ignorecase = true
opt.smartcase = true -- Enable smart search
opt.iskeyword:append("-") -- Dash as part of the word

-----------------------------------------------------------
-- Adding cyrillic mappings for normal and visual mode
-----------------------------------------------------------
opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ"
opt.langmap = "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
