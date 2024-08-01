-- Configuration for window-related plugins

return {
  -- Tabs in topbar
  require 'plugins.barbar',

  -- Filesystem tree view
  require 'plugins.nvim-tree',

  -- Terminal in a floating window
  {
    'voldikss/vim-floaterm',
  },

  -- Code breadcrumbs in the topbar
  require 'plugins.barbecue',

  -- Statusline
  require 'plugins.lualine',

  -- Help with keybindings
  require 'plugins.which-key',
}
