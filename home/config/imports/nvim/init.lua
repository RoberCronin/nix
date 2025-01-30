vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install and initialize Lazy and plugins
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup("plugins")

require("colors")
require("options")

local function toggle_line_wrap()
  if vim.o.wrap then
    vim.opt.wrap = false
  else
    vim.opt.wrap = true
  end
end
-- keymaps
vim.keymap.set("n", "<leader>lw", toggle_line_wrap, {})
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

vim.keymap.set('v', '<leader>y', '"+y', {})
vim.keymap.set('n', '<leader>yy', '"+yy', {})
--vim.keymap.set('n', '<leader>P', '"+p', {})
