vim.keymap.set("n", "<Leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("t", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("t", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("t", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("t", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')
