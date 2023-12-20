return {
    "hrsh7th/nvim-cmp",
    opts = function()
        local cmp = require("cmp")
        -- This snippet should enable autocompletion for non-english words
        -- (cyrillic in my case)
        return {
            sources = cmp.config.sources({ { name = "buffer", option = { keyword_pattern = [[\k\+]] } } }),
        }
    end,
}
