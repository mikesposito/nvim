local P = require 'mikesposito.setup.preferences'

return {
  'rmehri01/onenord.nvim',
  config = function()
    require('onenord').setup { theme = P.THEME_COLOR_SCHEME }
  end,
}
