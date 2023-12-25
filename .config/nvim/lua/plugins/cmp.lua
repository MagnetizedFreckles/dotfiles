return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require("cmp")
        -- This snippet should enable autocompletion for non-english words
        -- (cyrillic in my case)
        -- TODO: If possible, make it also work for words that start with capital letters
        opts.sources = cmp.config.sources({ { name = "buffer", option = { keyword_pattern = [[\k\+]] } } })
    end,
}
