-- Configuration for window-related plugins

return {
  -- Tabs in topbar
  Global.tabs_enabled and require 'plugins.barbar' or {},

  -- Filesystem tree view
  require 'plugins.nvim-tree',

  -- Terminal in a floating window
  {
    'voldikss/vim-floaterm',
  },

  -- Code breadcrumbs in the topbar
  require 'plugins.barbecue',

  -- Statusline
  Global.window_statusline_enabled and require 'plugins.lualine' or {},

  -- Help with keybindings
  require 'plugins.which-key',
}
