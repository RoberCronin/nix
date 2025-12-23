return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            nix = { "alejandra" },
            cpp = { "clang-format" },
            c = { "clang-format" },
            python = { "black" },
            jsonc = { "jsonfmt" },
            typst = { "typstyle" },
        },

        format_on_save = {
            timeout_ms = 5000,
            lsp_format = "fallback",
        },
    },
}
