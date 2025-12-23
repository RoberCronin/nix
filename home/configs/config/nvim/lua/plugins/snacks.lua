return {
    "folke/snacks.nvim",
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
            sources = {
                explorer = {
                    auto_close = true,
                    replace_netrw = true,
                    trash = true,
                },
            },
        },
    },
}
