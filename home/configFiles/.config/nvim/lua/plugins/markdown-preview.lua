return {
    "iamcco/markdown-preview.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    lazy = true,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
}
