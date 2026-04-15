return {
    "neovim/nvim-lspconfig",
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("cmake", { capabilities = capabilities })
        vim.lsp.enable("cmake")
        vim.filetype.add({ filename = { ["CMakeLists.txt"] = "cmake" } })

        vim.lsp.config("lua_la", { capabilities = capabilities })
        vim.lsp.enable("lua_ls")

        vim.lsp.config("clangd", { capabilities = capabilities })
        vim.lsp.enable("clangd")

        vim.lsp.config("basedpyright", {
            capabilities = capabilities,
            settings = {
                basedpyright = {
                    typeCheckingMode = "standard",
                    diagnosticmode = "workspace",
                    uselibrarycodefortypes = true,
                    autoimportcompletions = true,
                    autosearchpaths = true,
                    allowedUntypedLibraries = true,
                },
            },
        })
        vim.lsp.enable("basedpyright")

        vim.lsp.config("nixd", {
            capabilities = capabilities,
            nixpkgs = {
                expr = "import <nixpkgs> { }",
            },
            options = {
                nixos = {
                    expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
                },
                home_manager = {
                    expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
                },
            },
        })
        vim.lsp.enable("nixd")

        vim.lsp.config("glsl_analyzer", { capabilities = capabilities })
        vim.lsp.enable("glsl_analyzer")

        vim.lsp.config("tinymist", { capabilities = capabilities })
        vim.lsp.enable("tinymist")

        vim.lsp.config("harper_ls", {
            filetypes = { "markdown", "gitcommit", "typst" },
            capabilities = capabilities,
        })
        vim.lsp.enable("harper_ls")

        vim.lsp.config("rust_analyzer", { capabilities = capabilities })
        vim.lsp.enable("rust_analyzer")

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references)
        vim.keymap.set("n", "<leader>cd", vim.lsp.buf.type_definition)
        vim.keymap.set("n", "<leader>cs", vim.lsp.buf.document_symbol)

        vim.keymap.set("n", "<leader>sh", ":LspClangdSwitchSourceHeader<CR>")

        vim.diagnostic.config({ virtual_text = false })
    end,

    opts = {
        servers = {},
    },
}
