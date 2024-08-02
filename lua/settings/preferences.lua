Global = vim.g
Options = vim.opt

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
Global.mapleader = ' '
Global.maplocalleader = ' '

-- [General Settings]
Global.loaded_netrw = 1
Global.loaded_netrwPlugin = 1

-- [Code Assistance Features]
-- Autocompletion
Options.assist.autocompletion_enabled = true
-- Copilot
Options.assist.copilot_enabled = true

-- [Code formatting features]
-- Format the document automatically on save
Options.formatting.format_on_save = true

-- [Git features]
-- Enable git signs
Options.git.enable_signs = true

-- [Language features]
-- Add your favourite languages here
Options.lang.lsp_servers = {
  rust_analyzer = {},
  tsserver = {
    filetypes = {
      'typescript',
      'typescriptreact',
      'javascript',
    },
  },
  html = {
    filetypes = {
      'html',
      'twig',
      'hbs',
    },
  },
  lua_ls = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      diagnostics = {
        globals = {
          'vim',
        },
      },
    },
  },
}

-- [Theme options]
Options.theme.colorscheme = 'github_dark_default'

-- [Window options]
-- Enable tabs management
Options.window.tabs_enabled = true
-- Enable statusline (bottom)
Options.window.statusline_enabled = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

vim.o.relativenumber = true

vim.o.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Fix python path
Global.python_host_prog = '/opt/homebrew/bin/python3'
-- Global.node_host_prog = vim.fn.system('nvm which current'):match('(.-)\n') .. '/bin/cli.js'

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
