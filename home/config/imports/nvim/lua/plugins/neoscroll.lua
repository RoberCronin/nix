return {
  "karb94/neoscroll.nvim",
  opts = {},
  config = function()
      local neoscroll = require('neoscroll')
      neoscroll.setup({
          easing = "cubic",
          duration_multiplier = 0.4,
      })
  end
}
