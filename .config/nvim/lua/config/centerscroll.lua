local M = {}

function CenterCursor()
    -- This should add "zz" after every executed command, so separate keymaps should be unnecessary
    -- So far, this works as intended
    vim.api.nvim_feedkeys("zz", "nt", true)
end

function M.centerscroll()
    local visible_lines = vim.fn.winheight(0)
    local screen_center = math.ceil(visible_lines / 2)
    local scrolloff_value = screen_center - 1

    local distance_to_eof = vim.fn.line("$") - vim.fn.line(".")

    if distance_to_eof <= screen_center then
        -- I thought that setting scrolloff on every move of cursor is ineffective, hence these checks.
        -- But maybe just setting scrolloff is faster than performing the check, idk
        if vim.opt.scrolloff:get() ~= 0 then
            vim.opt.scrolloff = 0
            CenterCursor()
        else
            CenterCursor()
        end
    elseif distance_to_eof > screen_center then
        if vim.opt.scrolloff:get() ~= scrolloff_value then
            vim.opt.scrolloff = scrolloff_value
        end
    end
end

return M

--[[
-- These keymaps may be better at keeping cursor centered, but idk
map("n", "j", "jzz", { noremap = true, silent = true }) -- :nnoremap j jzz
map("n", "k", "kzz", { noremap = true, silent = true }) -- :nnoremap k kzz
map("v", "j", "jzz", { noremap = true, silent = true }) -- :vnoremap j jzz
map("v", "k", "kzz", { noremap = true, silent = true }) -- :vnoremap k kzz
-- The same for cyrillic layouts
map("n", "о", "jzz", { noremap = true, silent = true }) -- :nnoremap о jzz
map("n", "л", "kzz", { noremap = true, silent = true }) -- :nnoremap л kzz
map("v", "о", "jzz", { noremap = true, silent = true }) -- :vnoremap о jzz
map("v", "л", "kzz", { noremap = true, silent = true }) -- :vnoremap л kzz
]]
