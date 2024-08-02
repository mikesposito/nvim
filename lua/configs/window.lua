-- Configuration for window-related plugins

return {
  -- Tabs in topbar
  Options.window.tabs_enabled and require 'plugins.barbar' or {},

  -- Filesystem tree view
  require 'plugins.nvim-tree',

  -- Terminal in a floating window
  {
    'voldikss/vim-floaterm',
  },

  -- Code breadcrumbs in the topbar
  require 'plugins.barbecue',

  -- Statusline
  Options.window.statusline_enabled and require 'plugins.lualine' or {},

  -- Help with keybindings
  require 'plugins.which-key',
}
