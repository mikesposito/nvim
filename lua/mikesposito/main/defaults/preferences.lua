local P = {}

-- Set <space> as the leader key
-- See `:help mapleader`
P.LEADER = ' '

-- [Code Assistance Features]
-- Autocompletion
P.CODE_AUTOCOMPLETION_ENABLED = true
-- Copilot
P.CODE_COPILOT_ENABLED = true
-- Format the document automatically on save
P.CODE_FORMAT_ON_SAVE = true

-- [Theme]
P.THEME = 'mikesposito.main.configs.plugins.gruvbox'
P.THEME_COLOR_SCHEME = 'gruvbox'

-- [UI]
-- Enable dimming of inactive code
P.CODE_TWILIGHT_ENABLED = false

-- [Git features]
-- Enable git signs
P.GIT_SIGNS_ENABLED = true

-- [Window options]
-- Enable tabs management
P.WINDOW_TABS_ENABLED = true
-- Enable statusline (bottom)
P.WINDOW_STATUS_LINE_ENABLED = true
-- Open code outline on editor startup
P.WINDOW_OPEN_OUTLINE_ON_STARTUP = false
-- Set highlight on search
P.WINDOW_HIGHLIGHT_ON_SEARCH = false
-- Make line numbers default
P.WINDOW_LINE_NUMBERS_ENABLED = true
-- Line numbers are relative
P.WINDOW_SHOW_RELATIVE_NUMBERS = true
-- Enable cursor line
P.WINDOW_SHOW_CURSOR_LINE = true
-- Enable mouse mode
P.WINDOW_MOUSE_MODE_ENABLED = false

-- Sync clipboard between OS and Neovim.
P.USE_SYSTEM_CLIPBOARD = true

-- Enable break indent
P.BREAK_INDENT_ENABLED = true

-- Save undo history
P.SAVE_UNDO_FILE_HISTORY = true

-- Case-insensitive searching UNLESS \C or capital in search
P.SEARCH_SMART_CASE_ENABLED = true

-- Keep signcolumn on by default
P.SIGN_COLUMN_ENABLED = true

-- Decrease update time
P.UPDATE_TIME = 250
P.UPDATE_TIMEOUT = 300

-- [Language features]
-- Add your favourite languages here
local lang_lsp_servers = {
  rust_analyzer = {
    filetypes = {
      'rust',
      'toml',
    },
  },
  ts_ls = {
    filetypes = {
      'typescript',
      'typescriptreact',
      'javascript',
    },
  },
  eslint = {
    filetypes = {
      'typescript',
      'typescriptreact',
      'javascript',
    },
  },
  clangd = {
    filetypes = {
      'cpp',
      'cc',
      'c',
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
  vimls = {
    filetypes = {
      'vim',
    },
    Vim = {},
  },
}
P.LSP = lang_lsp_servers

return P
