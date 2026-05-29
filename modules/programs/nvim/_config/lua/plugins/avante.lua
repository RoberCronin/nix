return {
    "yetone/avante.nvim",
    -- Crucial: Tell lazy.nvim NOT to download or compile it. Nix already did this!
    dir = "/etc/profiles/per-user/" .. os.getenv("USER") .. "/share/nvim/site/pack/home-manager/start/avante-nvim",
    lazy = false,
    config = function()
        -- Force-load the pre-compiled Nix Rust binary
        require("avante_lib").load()

        -- Setup Avante
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
}

-- return {
--     "yetone/avante.nvim",
--     build = "nix-shell -p gnumake cargo rustc pkg-config openssl --run 'BUILD_FROM_SOURCE=true make'",
--
--     event = "VeryLazy",
--     version = false, -- Never set this value to "*"! Never!
--     ---@module 'avante'
--     ---@type avante.Config
--     opts = {
--         instructions_file = "avante.md",
--         provider = "openrouter",
--         providers = {
--             openrouter = {
--                 __inherited_from = "openai",
--                 endpoint = "https://openrouter.ai/api/v1",
--                 api_key_name = "OPENROUTER_API_KEY",
--                 model = "qwen/qwen3-coder-next",
--             },
--         },
--     },
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--         "MunifTanjim/nui.nvim",
--         "nvim-mini/mini.pick",
--         "nvim-telescope/telescope.nvim",
--         "hrsh7th/nvim-cmp",
--         "ibhagwan/fzf-lua",
--         "stevearc/dressing.nvim",
--         "folke/snacks.nvim",
--         "nvim-tree/nvim-web-devicons",
--         "zbirenbaum/copilot.lua",
--         {
--             -- Make sure to set this up properly if you have lazy=true
--             "MeanderingProgrammer/render-markdown.nvim",
--             opts = {
--                 file_types = { "markdown", "Avante" },
--             },
--             ft = { "markdown", "Avante" },
--         },
--     },
-- }
