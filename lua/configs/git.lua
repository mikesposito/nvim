-- Configuration for git related plugins

return {
  -- Diff
  require 'plugins.diffview',

  -- Git signs in the gutter
  require 'plugins.gitsigns',

  -- Like git cli but better (try :Git)
  'tpope/vim-fugitive',

  'tpope/vim-rhubarb',
}
