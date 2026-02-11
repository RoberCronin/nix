return {
    "chomosuke/typst-preview.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    lazy = true,
    ft = "typst",
    opts = {
        open_cmd = "qutebrowser %s",
    },
    keys = {
        {
            "<leader>tp",
            "<cmd>TypstPreviewToggle<cr>",
        },
    },
}
