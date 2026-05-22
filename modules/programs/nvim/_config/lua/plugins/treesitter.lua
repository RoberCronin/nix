return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    opts = { auto_install = true },
    build = ":TSUpdate",
}
