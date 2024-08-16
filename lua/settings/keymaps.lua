local which_key = require 'which-key'
local dap = require 'dap'
local dapui = require 'dapui'
local conform = require 'conform'
local telescope_builtin = require 'telescope.builtin'
local telescope_themes = require 'telescope.themes'
local gitsigns = require 'gitsigns'
local package_info = require 'package-info'

--- Add a label to document the keymap
--- @param key string
--- @param desc string
local label = function(key, desc)
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
local nmap = function(key, cmd, opts)
  vim.keymap.set('n', key, cmd, opts)
  label(key, opts.desc or '')
end

--- Map a key in visual mode
--- @param key string
--- @param cmd string | function
--- @param opts table
local vmap = function(key, cmd, opts)
  vim.keymap.set('v', key, cmd, opts)
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
nmap('<Space>', '<Nop>', { silent = true })
vmap('<Space>', '<Nop>', { silent = true })
---- Remap for dealing with word wrap
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
---- Better pagination
nmap('<C-d>', '<C-d>zz', { noremap = true, silent = true })
nmap('<C-u>', '<C-u>zz', { noremap = true, silent = true })
---- Tmux panes navigation supports
nmap('<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { desc = 'Jump to left pane' })
nmap('<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { desc = 'Jump to right pane' })
nmap('<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { desc = 'Jump to down pane' })
nmap('<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { desc = 'Jump to up pane' })

-- Code navigation
label('g', '[G]oto')
nmap('gd', telescope_builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
nmap('gr', telescope_builtin.lsp_references, { desc = '[G]oto [R]eferences' })
nmap('gi', telescope_builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
nmap('gD', telescope_builtin.lsp_type_definitions, { desc = '[Goto Type [D]efinition' })

-- Documentation
label('D', '[D]ocumentation')
nmap('Ds', vim.lsp.buf.signature_help, { desc = '[D]ocument [s]ignature' })
nmap('Dy', telescope_builtin.lsp_document_symbols, { desc = '[D]ocument s[y]mbols' })
nmap('Dh', vim.lsp.buf.hover, { desc = '[D]ocumentation [h]over' })

-- Language Servers
label('<leader>c', '[C]ode')
nmap('<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
nmap('<leader>cr', vim.lsp.buf.rename, { desc = '[R]ename' })

-- Debug keymaps
label('<leader>d', '[D]ebug')
nmap('<leader>dt', dapui.toggle, { desc = '[D]ebug: [T]oggle UI' })
nmap('<leader>dc', dap.continue, { desc = '[D]ebug: Start/[C]ontinue' })
nmap('<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug: Toggle [B]reakpoint' })
---- Debug navigation
label('<leader>ds', '[D]ebug [S]tep')
nmap('<leader>dsi', dap.step_into, { desc = 'Debug: Step Into' })
nmap('<leader>dsj', dap.step_over, { desc = 'Debug: Step Over' })
nmap('<leader>dso', dap.step_out, { desc = 'Debug: Step Out' })
---- Diagnostics
nmap('<leader>d[', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
nmap('<leader>d]', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
nmap('<leader>do', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
nmap('<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- File tree keymaps
nmap('<leader>e', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle [E]xplorer' })

-- Git Related keymaps
label('<leader>g', '[G]it')
label('<leader>gh', '[H]unks')
nmap('<leader>gg', ':FloatermNew lazygit<cr>', { desc = 'Open lazygit' })
-- -- Git actions in visual mode
vmap('<leader>ghs', function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'stage git hunk' })
vmap('<leader>ghr', function()
  gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'reset git hunk' })
-- -- Git actions in normal mode
nmap('<leader>ghs', gitsigns.stage_hunk, { desc = 'git stage hunk' })
nmap('<leader>ghr', gitsigns.reset_hunk, { desc = 'git reset hunk' })
nmap('<leader>ghS', gitsigns.stage_buffer, { desc = 'git Stage buffer' })
nmap('<leader>ghu', gitsigns.undo_stage_hunk, { desc = 'undo stage hunk' })
nmap('<leader>ghR', gitsigns.reset_buffer, { desc = 'git Reset buffer' })
nmap('<leader>ghp', gitsigns.preview_hunk, { desc = 'preview git hunk' })
nmap('<leader>ghb', function()
  gitsigns.blame_line { full = false }
end, { desc = 'git blame line' })
nmap('<leader>ghd', gitsigns.diffthis, { desc = 'git diff against index' })
nmap('<leader>ghD', function()
  gitsigns.diffthis '~'
end, { desc = 'git diff against last commit' })
-- -- Git toggles in normal mode
nmap('<leader>gtb', gitsigns.toggle_current_line_blame, { desc = 'toggle git blame line' })
nmap('<leader>gtd', gitsigns.toggle_deleted, { desc = 'toggle git show deleted' })

-- Search keymaps
label('<leader>s', '[S]earch')
nmap('<leader>sf', telescope_builtin.find_files, { desc = '[F]iles' })
nmap('<leader>s/', function()
  telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
nmap('<leader>ss', telescope_builtin.builtin, { desc = '[S]elect Telescope' })
nmap('<leader>sh', telescope_builtin.help_tags, { desc = '[H]elp' })
nmap('<leader>sw', telescope_builtin.grep_string, { desc = 'Current [W]ord' })
nmap('<leader>sg', telescope_builtin.live_grep, { desc = 'by [G]rep' })
nmap('<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'by [G]rep on Git Root' })
nmap('<leader>sd', telescope_builtin.diagnostics, { desc = '[D]iagnostics' })
nmap('<leader>sr', telescope_builtin.resume, { desc = '[R]esume' })
nmap('<leader>s?', telescope_builtin.oldfiles, { desc = '[?] Find [R]ecently opened files' })
nmap('<leader>s<space>', telescope_builtin.buffers, { desc = '[ ] Find open buffers' })

-- Formatting
nmap('<leader>f', function()
  conform.format {
    lsp_fallback = false,
    async = false,
    timeout_ms = 5000,
  }
end, { desc = '[F]ormat current buffer' })

-- Workspace
label('<leader>w', '[W]orkspace')
nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
nmap('<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist folders' })

-- Tab management
if vim.g.tabs_enabled then
  label('t', '[T]abs')
  ---- Move to previous/next
  nmap('th', '<Cmd>BufferPrevious<CR>', { desc = 'Previous Tab' })
  nmap('tl', '<Cmd>BufferNext<CR>', { desc = 'Next Tab' })
  ---- Re-order to previous/next
  nmap('t<', '<Cmd>BufferMovePrevious<CR>', { desc = 'Move previous tab' })
  nmap('t>', '<Cmd>BufferMoveNext<CR>', { desc = 'Move next tab' })
  ---- Goto buffer in position...
  nmap('t1', '<Cmd>BufferGoto 1<CR>', { desc = 'Go to tab 1' })
  nmap('t2', '<Cmd>BufferGoto 2<CR>', { desc = 'Go to tab 2' })
  nmap('t3', '<Cmd>BufferGoto 3<CR>', { desc = 'Go to tab 3' })
  nmap('t4', '<Cmd>BufferGoto 4<CR>', { desc = 'Go to tab 4' })
  nmap('t5', '<Cmd>BufferGoto 5<CR>', { desc = 'Go to tab 5' })
  nmap('t6', '<Cmd>BufferGoto 6<CR>', { desc = 'Go to tab 6' })
  nmap('t7', '<Cmd>BufferGoto 7<CR>', { desc = 'Go to tab 7' })
  nmap('t8', '<Cmd>BufferGoto 8<CR>', { desc = 'Go to tab 8' })
  nmap('t9', '<Cmd>BufferGoto 9<CR>', { desc = 'Go to tab 9' })
  nmap('t0', '<Cmd>BufferLast<CR>', { desc = 'Go to last tab' })
  ---- Pin/unpin buffer
  nmap('tp', '<Cmd>BufferPin<CR>', { desc = 'Pin tab' })
  ---- Close buffer
  nmap('tx', '<Cmd>BufferClose<CR>', {})
end

-- Yarn Package management
label('<leader>y', '[Y]arn')
nmap('<leader>ya', package_info.install, { desc = '[A]dd package' })
nmap('<leader>yv', package_info.change_version, { desc = 'Change package [V]ersion' })
