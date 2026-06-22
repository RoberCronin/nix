return {
    "stevearc/conform.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            nix = { "alejandra" },
            cpp = { "clang-format" },
            c = { "clang-format" },
            python = { "black" },
            typst = { "typstyle" },
            rust = { "rustfmt" },
            jsonc = { "prettier" },
            json = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            css = { "prettier" },
            haskell = { "ormolu" },
        },

        format_on_save = {
            timeout_ms = 5000,
            lsp_format = "fallback",
        },
    },
}
