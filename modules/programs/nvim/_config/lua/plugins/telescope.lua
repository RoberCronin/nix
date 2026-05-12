return {
    "nvim-telescope/telescope.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    tag = "v0.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- keys = {
    --     { "<leader>ff", telescope.builtin.find_files },
    --     { "<leader>fg", telescope.builtin.live_grep },
    --     { "<leader>fb", telescope.builtin.buffers },
    --     { "<leader>fh", telescope.builtin.help_tags },
    -- },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "^.git/",
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
}
