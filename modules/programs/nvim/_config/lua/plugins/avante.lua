return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
        instructions_file = "avante.md",
        provider = "openrouter",
        providers = {
            openrouter = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                api_key_name = "OPENROUTER_API_KEY",
                model = "qwen/qwen3-coder-next",
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-mini/mini.pick",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "ibhagwan/fzf-lua",
        "stevearc/dressing.nvim",
        "folke/snacks.nvim",
        "nvim-tree/nvim-web-devicons",
        "zbirenbaum/copilot.lua",
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
