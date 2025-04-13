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

local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.65
  vim.g.transparency = 0.8
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8
  vim.g.neovide_hide_mouse_when_typing = true
  vim.cmd([[hi! Normal guibg=#24273A]])
end


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

vim.keymap.set('n', '<M-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<M-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<M-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<M-l>', ':wincmd l<CR>')

--vim.api.nvim_set_keymap("n", "<leader>pp", "<cmd>!uv run %<CR>", { noremap = false })
vim.keymap.set("n", "<leader>pp", function ()
    local file = vim.fn.expand("%")
    vim.cmd(string.format("VimuxRunCommand 'uv run %s'", file))
end)

-- vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
-- vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
-- vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
-- vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
-- vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "evaluate visual selection" })
