local P = require 'custom.preferences'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = P.LEADER
vim.g.maplocalleader = P.LEADER

-- [General Settings]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = P.WINDOW_HIGHLIGHT_ON_SEARCH

-- Make line numbers default
vim.wo.number = P.WINDOW_LINE_NUMBERS_ENABLED

vim.o.relativenumber = P.WINDOW_SHOW_RELATIVE_NUMBERS

vim.o.cursorline = P.WINDOW_SHOW_CURSOR_LINE

-- Enable mouse mode
if P.WINDOW_MOUSE_MODE_ENABLED then
  vim.o.mouse = 'a'
end

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = P.USE_SYSTEM_CLIPBOARD and 'unnamedplus'

-- Enable break indent
vim.o.breakindent = P.BREAK_INDENT_ENABLED

-- Save undo history
vim.o.undofile = P.SAVE_UNDO_FILE_HISTORY

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = P.SEARCH_SMART_CASE_ENABLED
vim.o.smartcase = P.SEARCH_SMART_CASE_ENABLED

-- Keep signcolumn on by default
vim.wo.signcolumn = P.SIGN_COLUMN_ENABLED and 'yes'

-- Decrease update time
vim.o.updatetime = P.UPDATE_TIME
vim.o.timeoutlen = P.UPDATE_TIMEOUT

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Fix python path
vim.g.python_host_prog = '/opt/homebrew/bin/python3'
-- vim.g.node_host_prog = vim.fn.system('nvm which current'):match('(.-)\n') .. '/bin/cli.js'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
