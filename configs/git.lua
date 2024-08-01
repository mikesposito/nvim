-- Configuration for git related plugins

return {
  -- Diff
  {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup()
    end
  }
}
