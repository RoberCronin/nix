return {
    "max397574/better-escape.nvim",
    config = function()
        require("better_escape").setup({
            timeout = vim.o.timeoutlen,
            default_mappings = false,
            mappings = {
                -- i for insert
                i = {
                    j = {
                        k = "<Esc>",
                    },
                    k = {
                        j = "<Esc>",
                    },
                },
            },
        })
    end,
}
