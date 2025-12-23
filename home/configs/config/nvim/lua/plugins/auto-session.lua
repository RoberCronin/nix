return {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config

    keys = {
        {
            "<leader>ss",
            ":AutoSession search<CR>",
        },
    },
    opts = {
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        -- log_level = 'debug',
    },
}
