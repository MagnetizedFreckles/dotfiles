local Util = require("lazy.core.util")
local opt = vim.opt

local M = {}

-- Switches main spellcheck dictionaries between two
-- Enables spellchecking with first one if disabled
function M.langtoggle(t1, t2)
    local s1 = table.concat(t1)
    local s2 = table.concat(t2)
    -- Next 3 lines are only to ensure that spellfile switching will work
    local home_dir = os.getenv("HOME")
    local spellfilepath1 = home_dir .. "/.config/nvim/spell/" .. s1:sub(1, 2) .. ".utf-8.add"
    local spellfilepath2 = home_dir .. "/.config/nvim/spell/" .. s2:sub(1, 2) .. ".utf-8.add"

    if opt.spell:get() == false then
        opt.spell = true
        opt.spelllang = t1
        opt.spellfile = spellfilepath1
        Util.info("Toggled spellcheck to " .. s1, { title = "Option" })
    elseif opt.spell:get() == true then
        if table.concat(opt.spelllang:get()) == s1 then
            opt.spelllang = t2
            opt.spellfile = spellfilepath2
            Util.info("Toggled spellcheck to " .. s2, { title = "Option" })
        else
            opt.spelllang = t1
            opt.spellfile = spellfilepath1
            Util.info("Toggled spellcheck to " .. s1, { title = "Option" })
        end
    end
end

return M
