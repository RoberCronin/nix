return {
    "chomosuke/typst-preview.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    lazy = true,
    ft = "typst",
    opts = {},
    keys = {
        {
            "<leader>tp",
            "<cmd>TypstPreviewToggle<cr>",
        },
    },
}
