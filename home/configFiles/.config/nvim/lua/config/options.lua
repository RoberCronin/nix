-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
    vim.g.neovide_hide_mouse_when_typing = true
end

vim.g.clipboard = "wl-copy"

vim.opt.tabstop = 4
--opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 20
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true

-- for autosessions
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if not vim.g.vscode then
    vim.api.nvim_cmd({ cmd = "colorscheme", args = { "catppuccin-macchiato" } }, {})
end
