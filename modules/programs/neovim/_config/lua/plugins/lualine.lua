return {
    "nvim-lualine/lualine.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/lsp-status.nvim" },
    -- config = function()
    --     require("lualine").setup({
    --         options = { sections = { lualine_c = { "os.date('%a')", "data", "require'lsp-status'.status()" } } },
    --     })
    -- end,
    config = function()
        local prose = require("nvim-prose")

        require("lualine").setup({
            sections = {
                lualine_c = {
                    -- Add the lsp-progress provider here
                    function()
                        return require("lsp-progress").progress()
                    end,
                },
                lualine_x = {
                    { prose.word_count, cond = prose.is_available },
                    { prose.reading_time, cond = prose.is_available },
                },

                -- Other sections...
            },
            -- ... other lualine settings
        })

        -- Listen for events to refresh Lualine
        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = "lualine_augroup",
            pattern = "LspProgressStatusUpdated",
            callback = require("lualine").refresh,
        })
    end,
}
