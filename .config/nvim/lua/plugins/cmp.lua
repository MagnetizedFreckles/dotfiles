return {
    "hrsh7th/nvim-cmp",
    dependencies = { "f3fora/cmp-spell" },
    opts = function(_, opts)
        local cmp = require("cmp")
        opts.sources = cmp.config.sources({
            -- This snippet should enable autocompletion for non-english words
            -- (cyrillic in my case)
            -- TODO: If possible, make it also work for words that start with capital letters
            { name = "buffer", option = { keyword_pattern = [[\k\+]] } },
            -- Use spelllang dictionaries as source
            -- TODO: Somehow differentiate spelllang suggestions from buffer
            {
                name = "spell",
                option = {
                    keep_all_entries = false,
                    enable_in_context = function()
                        return true
                    end,
                },
            },
        })
    end,
}
