return {
  'theprimeagen/harpoon',
  config = function()
    -- HARpoon keymaps
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = '[A]dd file' })
    vim.keymap.set('n', '<leader>hu', ui.toggle_quick_menu, { desc = 'Open [u]i'})

    vim.keymap.set('n', '<M-1>', function() ui.nav_file(1) end)
    vim.keymap.set('n', '<M-2>', function() ui.nav_file(2) end)
    vim.keymap.set('n', '<M-3>', function() ui.nav_file(3) end)
    vim.keymap.set('n', '<M-4>', function() ui.nav_file(4) end)
  end,
}
