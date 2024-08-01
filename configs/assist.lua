-- Configuration for code assist plugins

return {
  -- GitHub Copilot (AI pair programming)
  {
    'github/copilot.vim',
    lazy = false,
    config = function ()
      vim.g.copilot_assume_mapped = true
    end
  },

  -- Highlight similar words
  {
    'tzachar/local-highlight.nvim',
  },
}

