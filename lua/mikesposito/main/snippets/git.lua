local gitsigns = require 'gitsigns'

local Git = {}

-- Push the current branch
Git.push = function()
  vim.cmd.Git 'push'
end

-- Pull the current branch
Git.pull = function()
  vim.cmd.Git 'pull'
end

--- Stage the highlighted hunk
Git.stage_hunk = function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end

--- Reset the highlighted hunk
Git.reset_hunk = function()
  gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end

Git.copy_permalink = function(mode)
  require('gitlinker').get_buf_range_url(mode, { action_callback = require('gitlinker.actions').copy_to_clipboard })
end

return Git
