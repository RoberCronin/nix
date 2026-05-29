return {
    "yetone/avante.nvim",
    dir = os.getenv("NVIM_AVANTE_PATH"),
    lazy = false,
    config = function()
        require("avante_lib").load()
        require("avante").setup({
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
        })
    end,
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
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
