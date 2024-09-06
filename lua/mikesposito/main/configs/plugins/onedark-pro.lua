local P = require 'mikesposito.preferences.general'

return {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- Ensure it loads first
  config = function()
    require('onedarkpro').setup()
    vim.cmd('colorscheme ' .. P.THEME_FLAVOUR)
  end,
}
