-- Configuration for window-related plugins

return {
  -- Tabs in topbar
  vim.g.tabs_enabled and require 'main.configs.plugins.barbar' or {},

  -- Filesystem tree view
  require 'main.configs.plugins.nvim-tree',

  -- Terminal in a floating window
  {
    'voldikss/vim-floaterm',
  },

  -- Terminal in split window
  require 'main.configs.plugins.toggleterm',

  -- Code breadcrumbs in the topbar
  require 'main.configs.plugins.barbecue',

  -- Statusline
  vim.g.window_statusline_enabled and require 'main.configs.plugins.lualine' or {},

  -- Help with keybindings
  require 'main.configs.plugins.which-key',

  -- Smooth navigation between tmux panes
  require 'main.configs.plugins.nvim-tmux-navigation',
}
