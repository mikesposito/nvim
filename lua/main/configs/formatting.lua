-- Configuration for autoformatting plugins

return {
  -- Automatically close brackets, quotes, etc.
  vim.g.formatting_autopairs_enabled and require 'main.configs.plugins.autopairs' or {},

  -- Automatically format code
  require 'main.configs.plugins.conform',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
}
