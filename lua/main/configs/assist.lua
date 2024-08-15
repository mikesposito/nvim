-- Configuration for code assist plugins

return {
  -- GitHub Copilot (AI pair programming)
  vim.g.assist_copilot_enabled and require 'main.configs.plugins.copilot' or {},

  -- Highlight similar words
  require 'main.configs.plugins.local_highlight',

  -- Autocompletion
  vim.g.assist_autocompletion_enabled and require 'main.configs.plugins.nvim-cmp' or {},

  -- Comment code
  'numToStr/Comment.nvim',

  -- Highlight, edit, and navigate code
  require 'main.configs.plugins.nvim-treesitter',
}
