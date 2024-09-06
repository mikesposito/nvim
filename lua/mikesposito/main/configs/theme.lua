local P = require 'mikesposito.preferences.general'
-- Configuration for colorschemes and themes

return {
  -- Main theme (you change it in lua/preferences/general)
  require(P.THEME),

  -- Icons
  require 'mikesposito.main.configs.plugins.web-devicons',

  -- Indentation guides
  require 'mikesposito.main.configs.plugins.indent-blankline',

  -- Indentation magic guide
  require 'mikesposito.main.configs.plugins.indentscope',
}
