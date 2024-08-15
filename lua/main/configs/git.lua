-- Configuration for git related plugins

return {
  -- Diff
  require 'main.configs.plugins.diffview',

  -- Git signs in the gutter
  vim.g.git_enable_signs and require 'main.configs.plugins.gitsigns' or {},

  -- Like git cli but better (try :Git)
  'tpope/vim-fugitive',

  -- GitHub PRs, issues and reviews
  require 'main.configs.plugins.octo',
}
