local P = require 'mikesposito.preferences.general'

-- Configuration for window-related plugins

return {
  -- Tabs in topbar
  P.WINDOW_TABS_ENABLED and require 'mikesposito.main.configs.plugins.barbar' or {},

  -- Filesystem tree view
  require 'mikesposito.main.configs.plugins.nvim-tree',

  -- Terminal in a floating window
  {
    'voldikss/vim-floaterm',
  },

  -- Terminal in split window
  require 'mikesposito.main.configs.plugins.toggleterm',

  -- Code breadcrumbs in the topbar
  require 'mikesposito.main.configs.plugins.barbecue',

  -- Statusline
  P.WINDOW_STATUS_LINE_ENABLED and require 'mikesposito.main.configs.plugins.lualine' or {},

  -- Help with keybindings
  require 'mikesposito.main.configs.plugins.which-key',

  -- Smooth navigation between tmux panes
  require 'mikesposito.main.configs.plugins.nvim-tmux-navigation',

  -- Start screen
  require 'mikesposito.main.configs.plugins.mini-starter',

  -- Symbol navigation
  require 'mikesposito.main.configs.plugins.aerial',

  -- Nice notifications and messages
  require 'mikesposito.main.configs.plugins.noice',
}
