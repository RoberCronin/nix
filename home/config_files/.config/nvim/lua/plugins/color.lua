return {
    "catppuccin/nvim",
    cond = function()
        return not vim.g.vscode
    end,
    name = "catppuccin",
    priority = 1000,
    opts = {
        term_colors = true,
    },
}
