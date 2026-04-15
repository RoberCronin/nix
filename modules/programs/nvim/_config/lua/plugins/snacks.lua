return {
    "folke/snacks.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
        },
    },

    opts = {
        dashboard = {
            enabled = true,
            preset = {
                header = "",
            },
        },
        picker = {
            enabled = true,
            hidden = true,
            sources = {
                explorer = {
                    auto_close = true,
                    replace_netrw = true,
                    trash = true,
                    hidden = true,
                },
            },
        },
        bigfile = {
            enabled = true,
        },
    },
}
