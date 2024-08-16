local gitsigns = require 'gitsigns'
local which_key = require 'which-key'
local conform = require 'conform'
local telescope_builtin = require 'telescope.builtin'
local telescope_themes = require 'telescope.themes'

local Utils = {}

--- Add a label to document the keymap
--- @param key string
--- @param desc string
Utils.label = function(key, desc)
  which_key.register {
    [key] = {
      name = desc,
      _ = 'which_key_ignore',
    },
  }
end

--- Map a key in normal mode, adding also a label
--- for documentation
--- @param key string
--- @param cmd string | function
--- @param opts table
Utils.nmap = function(key, cmd, opts)
  vim.keymap.set('n', key, cmd, opts)
  Utils.label(key, opts.desc or '')
end

--- Map a key in visual mode
--- @param key string
--- @param cmd string | function
--- @param opts table
Utils.vmap = function(key, cmd, opts)
  vim.keymap.set('v', key, cmd, opts)
end

--- Stage the highlighted hunk
Utils.git_stage_hunk = function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end

--- Reset the highlighted hunk
Utils.git_reset_hunk = function()
  gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end

--- Fuzzy search the current buffer
Utils.fuzzy_search_current_buffer = function()
  telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end

--- Format code using the configured formatter
Utils.format_buffer = function()
  conform.format {
    lsp_fallback = false,
    async = false,
    timeout_ms = 5000,
  }
end

--- List the workspace folders
Utils.workspace_list_folders = function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

return Utils
