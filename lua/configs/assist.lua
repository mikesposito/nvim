-- Configuration for code assist plugins

return {
  -- GitHub Copilot (AI pair programming)
  require 'plugins.copilot',

  -- Highlight similar words
  require 'plugins.local_highlight',

  -- Autocompletion
  require 'plugins.nvim-cmp',

  -- Comment code
  'numToStr/Comment.nvim',

  -- Highlight, edit, and navigate code
  require 'plugins.nvim-treesitter',
}
