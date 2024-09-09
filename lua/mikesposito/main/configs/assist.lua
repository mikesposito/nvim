local P = require 'mikesposito.preferences.general'

-- Configuration for code assist plugins

return {
  -- GitHub Copilot (AI pair programming)
  P.CODE_COPILOT_ENABLED and require 'mikesposito.main.configs.plugins.copilot' or {},

  -- Highlight similar words
  require 'mikesposito.main.configs.plugins.local_highlight',

  -- Autocompletion
  P.CODE_AUTOCOMPLETION_ENABLED and require 'mikesposito.main.configs.plugins.nvim-cmp' or {},

  -- Comment code
  'numToStr/Comment.nvim',

  -- Highlight, edit, and navigate code
  require 'mikesposito.main.configs.plugins.nvim-treesitter',

  -- Markdown preview
  require 'mikesposito.main.configs.plugins.markdown-preview',

  -- TODOs highlighting
  require 'mikesposito.main.configs.plugins.todo-comments',
}
