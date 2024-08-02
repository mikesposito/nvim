-- Configuration for autoformatting plugins

return {
  -- Automatically close brackets, quotes, etc.
  Global.formatting_autopairs_enabled and require 'plugins.autopairs' or {},

  -- Automatically format code
  require 'plugins.conform',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
}
