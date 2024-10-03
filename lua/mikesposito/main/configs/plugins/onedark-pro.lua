local P = require 'custom.preferences'

return {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- Ensure it loads first
  config = function()
    require('onedarkpro').setup()
    vim.cmd('colorscheme ' .. P.THEME_COLOR_SCHEME)
  end,
}
