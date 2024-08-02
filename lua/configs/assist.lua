-- Configuration for code assist plugins

return {
  -- GitHub Copilot (AI pair programming)
  Global.assist_copilot_enabled and require 'plugins.copilot' or {},

  -- Highlight similar words
  require 'plugins.local_highlight',

  -- Autocompletion
  Global.assist_autocompletion_enabled and require 'plugins.nvim-cmp' or {},

  -- Comment code
  'numToStr/Comment.nvim',

  -- Highlight, edit, and navigate code
  require 'plugins.nvim-treesitter',
}
