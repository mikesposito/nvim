local P = require 'custom.preferences'

return {
  'navarasu/onedark.nvim',
  config = function()
    local onedark = require 'onedark'
    onedark.setup {
      style = P.THEME_COLOR_SCHEME,
    }
    onedark.load()
  end,
}
