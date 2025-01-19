  return {
    'alker0/chezmoi.vim',
    --lazy = false,
    --event = "VeryLazy",
    init = function()
      -- This option is required.
      vim.g['chezmoi#use_tmp_buffer'] = true
      -- add other options here if needed.
    end,
  }
