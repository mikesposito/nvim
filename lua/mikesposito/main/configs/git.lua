local P = require 'custom.preferences'

-- Configuration for git related pluginsì
return {
  -- Diff
  require 'mikesposito.main.configs.plugins.diffview',

  -- Git signs in the gutter
  P.GIT_SIGNS_ENABLED and require 'mikesposito.main.configs.plugins.gitsigns' or {},

  -- Like git cli but better (try :Git)
  'tpope/vim-fugitive',

  -- GitHub PRs, issues and reviews
  require 'mikesposito.main.configs.plugins.octo',

  -- GitHub / GitLab CI/CD pipelines
  require 'mikesposito.main.configs.plugins.pipeline',

  -- Git permalinks
  require 'mikesposito.main.configs.plugins.gitlinker',
}
