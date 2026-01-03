return {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("cmake", { capabilities = capabilities })
        vim.lsp.enable("cmake")
        vim.filetype.add({ filename = { ["CMakeLists.txt"] = "cmake" } })

        vim.lsp.config("lua_la", { capabilities = capabilities })
        vim.lsp.enable("lua_ls")

        vim.lsp.config("clangd", { capabilities = capabilities })
        vim.lsp.enable("clangd")

        vim.lsp.config("basedpyright", { capabilities = capabilities })
        vim.lsp.enable("basedpyright")

        vim.lsp.config("nil_ls", { capabilities = capabilities })
        vim.lsp.enable("nil_ls")

        vim.lsp.config("glsl_analyzer", { capabilities = capabilities })
        vim.lsp.enable("glsl_analyzer")

        vim.lsp.config("tinymist", { capabilities = capabilities })
        vim.lsp.enable("tinymist")

        vim.lsp.config("harper_ls", { capabilities = capabilities })
        vim.lsp.enable("harper_ls")

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references)
        vim.keymap.set("n", "<leader>cd", vim.lsp.buf.type_definition)
        vim.keymap.set("n", "<leader>cs", vim.lsp.buf.document_symbol)

        vim.diagnostic.config({ virtual_text = false })
    end,

    opts = {
        servers = {},
    },
}
