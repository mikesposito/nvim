-- Configuration for autoformatting plugins

return {
  -- Automatically close brackets, quotes, etc.
  vim.g.formatting_autopairs_enabled and require 'mikesposito.main.configs.plugins.autopairs' or {},

  -- Automatically format code
  require 'mikesposito.main.configs.plugins.conform',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
}
