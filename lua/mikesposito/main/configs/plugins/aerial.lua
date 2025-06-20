local P = require 'mikesposito.setup.preferences'

return {
  'stevearc/aerial.nvim',
  opts = {
    open_automatic = P.WINDOW_OPEN_OUTLINE_ON_STARTUP,
    filter_kind = false,
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
