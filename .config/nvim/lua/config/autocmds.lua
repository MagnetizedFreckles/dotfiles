-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--[[ autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
          pattern = {"*.rmd"},
          command = "echo "require(rmarkdown);render('<c-r>%')" \| R --vanilla",
        })


vim.api.nvim_create_autocmd("FileType", { pattern = "rmd",
    callback = function()
        vim.api.nvim_buf_set_keymap(<F5>,"echo "require(rmarkdown);render('<c-r>%')" \| R --vanilla",opts)
    end})
]]
