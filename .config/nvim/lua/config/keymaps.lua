-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazy.core.util")
local spellswitch = require("config.spellswitch")
-- local dumbpunto = require("config.dumbpunto")

local map = vim.api.nvim_set_keymap
-- local opt = vim.opt

-- Assign tables to variables to improve modularity and readability
local enru = { "en", "ru" }
local ruen = { "ru", "en" }
local enuk = { "en", "uk" }
local uken = { "uk", "en" }

function DisableSpell()
    vim.cmd("set nospell")
    Util.warn("Disabled spellchecking", { title = "Option" })
end

-- Space-u-j to change variations of En-Ru spellcheck
function ToggleRu()
    spellswitch.langtoggle(enru, ruen)
end
map("n", "<leader>uj", ":lua ToggleRu()<CR>", { noremap = true, silent = true, desc = "Russian spellcheck" })

-- Space-u-k to change variations of En-Uk spellcheck
function ToggleUk()
    spellswitch.langtoggle(enuk, uken)
end
map("n", "<leader>uk", ":lua ToggleUk()<CR>", { noremap = true, silent = true, desc = "Ukrainian spellcheck" })

-- F7 to disable spellcheck completely
map("n", "<F7>", ":lua DisableSpell()<CR>", { noremap = true, silent = true })

--[[ F6 to switch layout of selected text
function DumbPunto()
    dumbpunto.ChangeLayout()
end
map("v", "<F6>", ":lua DumbPunto()<CR>", { noremap = true, silent = true })
]]
