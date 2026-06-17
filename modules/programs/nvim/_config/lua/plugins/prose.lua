return {
    "skwee357/nvim-prose",
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        require("nvim-prose").setup({
            wpm = 200.0,
            filetypes = { "markdown", "asciidoc", "typst", "text" },
            placeholders = {
                words = "words",
                minutes = "min",
            },
        })
    end,
}
