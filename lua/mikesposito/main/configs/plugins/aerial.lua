local P = require 'mikesposito.preferences.general'

return {
  'stevearc/aerial.nvim',
  opts = {
    open_automatic = P.WINDOW_OPEN_OUTLINE_ON_STARTUP,
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
