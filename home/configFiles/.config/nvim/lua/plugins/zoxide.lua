return {
    "nanotee/zoxide.vim",
    cond = function()
        return not vim.g.vscode
    end,
}
