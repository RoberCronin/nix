return {
    "Aasim-A/scrollEOF.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    event = { "CursorMoved", "WinScrolled" },
    opts = {
        disabled_filetypes = { "terminal", "snacks_picker_list" },
    },
}
