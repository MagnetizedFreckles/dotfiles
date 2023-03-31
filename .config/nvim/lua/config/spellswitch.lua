local Util = require("lazy.core.util")
local opt = vim.opt

local M = {}

-- Switches main spellcheck dictionaries between two
-- Enables spellchecking with first one if disabled
function M.langtoggle(t1, t2)
    if opt.spell:get() == false then
        opt.spell = true
        opt.spelllang = t1
        Util.info("Toggled spellcheck to " .. table.concat(t1), { title = "Option" })
    elseif opt.spell:get() == true then
        if table.concat(opt.spelllang:get()) == table.concat(t1) then
            opt.spelllang = t2
            Util.info("Toggled spellcheck to " .. table.concat(t2), { title = "Option" })
        else
            opt.spelllang = t1
            Util.info("Toggled spellcheck to " .. table.concat(t1), { title = "Option" })
        end
    end
end

return M
