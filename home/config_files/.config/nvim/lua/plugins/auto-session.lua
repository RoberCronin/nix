return {
    "rmagatti/auto-session",
    cond = function()
        return not vim.g.vscode
    end,
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
