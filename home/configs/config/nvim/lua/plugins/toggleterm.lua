return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        open_mapping = "<leader>tt",
        insert_mappings = false,
    },
    keys = {
        {
            "<leader>V",
            ":ToggleTerm size=70 direction=vertical<CR>",
        },
        {
            "<leader>H",
            ":ToggleTerm size=25 direction=horizontal<CR>",
        },
    },
}
