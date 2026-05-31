return {
    "carlos-algms/agentic.nvim",
    lazy = false,
    --- @type agentic.PartialUserConfig
    opts = {
        provider = "opencode-acp",

        acp_providers = {
            ["opencode-acp"] = {
                name = "OpenCode",
                command = "opencode",
                args = { "acp" },

                initial_model = "qwen/qwen3-coder",

                env = {
                    OPENROUTER_API_KEY = vim.env.OPENROUTER_API_KEY,
                    OPENCODE_EXPERIMENTAL_OUTPUT_TOKEN_MAX = "4096",
                },
            },
        },

        windows = {
            position = "right",
            width = "40%",
        },
    },
    keys = {
        {
            "<C-\\>",
            function()
                require("agentic").toggle()
            end,
            mode = { "n", "v", "i" },
            desc = "Toggle Agentic Chat",
        },
        {
            "<C-'>",
            function()
                require("agentic").add_selection_or_file_to_context()
            end,
            mode = { "n", "v" },
            desc = "Add file or selection to Agentic Context",
        },
        {
            "<C-,>",
            function()
                require("agentic").new_session()
            end,
            mode = { "n", "v", "i" },
            desc = "New Agentic Session",
        },
        {
            "<A-i>r",
            function()
                require("agentic").restore_session()
            end,
            desc = "Agentic Restore session",
            silent = true,
            mode = { "n", "v", "i" },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-mini/mini.pick",
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "AgenticChat" },
            },
            ft = { "markdown", "AgenticChat" },
        },
    },
}
