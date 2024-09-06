local P = require 'mikesposito.preferences.general'

return {
  'rmehri01/onenord.nvim',
  config = function()
    require('onenord').setup { theme = P.THEME_COLOR_SCHEME }
  end,
}
