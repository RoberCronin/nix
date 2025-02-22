vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 500
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.hlsearch = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.mouse = 'a'
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
--vim.opt.conceallevel = 2

vim.opt.smartindent = true

vim.opt.scrolloff = 10

vim.diagnostic.config({ virtual_text = false })

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


