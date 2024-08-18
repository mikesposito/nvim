local dap = require 'dap'
local dapui = require 'dapui'
local telescope_builtin = require 'telescope.builtin'
local gitsigns = require 'gitsigns'
local package_info = require 'package-info'
local utils = require 'main.snippets.utils'
local git = require 'main.snippets.git'
local K = require 'main.settings.bindings'

local v = utils.vmap
local n = utils.nmap
local label = utils.label

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
n('<Space>', '<Nop>', { silent = true })
v('<Space>', '<Nop>', { silent = true })
---- Remap for dealing with word wrap
n('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
n('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
---- Better pagination
n('<C-d>', '<C-d>zz', { noremap = true, silent = true })
n('<C-u>', '<C-u>zz', { noremap = true, silent = true })
---- Tmux panes navigation supports
n('<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { desc = 'Jump to left pane' })
n('<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { desc = 'Jump to right pane' })
n('<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { desc = 'Jump to down pane' })
n('<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { desc = 'Jump to up pane' })

-- Code navigation
label('g', '[G]oto')
n(K.GOTO_DEFINITION, telescope_builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
n(K.GOTO_REFERENCES, telescope_builtin.lsp_references, { desc = '[G]oto [R]eferences' })
n(K.GOTO_IMPLEMENTATION, telescope_builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
n(K.GOTO_TYPE_DEFINITION, telescope_builtin.lsp_type_definitions, { desc = '[Goto Type [D]efinition' })

-- Documentation
label('D', '[D]ocumentation')
n(K.DOCS_SIGNATURE_HELP, vim.lsp.buf.signature_help, { desc = '[D]ocument [s]ignature' })
n(K.DOCS_SYMBOLS, telescope_builtin.lsp_document_symbols, { desc = '[D]ocument s[y]mbols' })
n(K.DOCS_HOVER, vim.lsp.buf.hover, { desc = '[D]ocumentation [h]over' })

-- Code Shortcuts
label('<leader>c', '[C]ode')
n(K.CODE_ACTIONS, vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
n(K.CODE_RENAME, vim.lsp.buf.rename, { desc = '[R]ename' })
---- Code Swap handled by `nvim-treesitter`
label(K.CODE_SWAP, '[C]ode [S]wap')

-- Debug keymaps
label('<leader>d', '[D]ebug')
n('<leader>dt', dapui.toggle, { desc = '[D]ebug: [T]oggle UI' })
n('<leader>dc', dap.continue, { desc = '[D]ebug: Start/[C]ontinue' })
n('<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug: Toggle [B]reakpoint' })
n('<leader>d[', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
n('<leader>d]', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
n('<leader>do', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
n('<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
label('<leader>ds', '[D]ebug [S]tep')
n('<leader>dsi', dap.step_into, { desc = 'Debug: Step Into' })
n('<leader>dsj', dap.step_over, { desc = 'Debug: Step Over' })
n('<leader>dso', dap.step_out, { desc = 'Debug: Step Out' })

-- File tree keymaps
n('<leader>e', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle [E]xplorer' })

-- Git Related keymaps
label('<leader>g', '[G]it')
n('<leader>gp', git.pull, { desc = '[p]ull' })
n('<leader>gP', git.push, { desc = '[P]ush' })
n('<leader>gg', ':FloatermNew lazygit<cr>', { desc = 'Open lazygit' })
n('<leader>gd', utils.diff_against_last_commit, { desc = '[D]iff against index' })
n('<leader>gD', gitsigns.diffthis, { desc = '[D]iff against last commit' })
label('<leader>gh', '[H]unks')
v('<leader>ghs', git.stage_hunk, { desc = 'stage git hunk' })
v('<leader>ghr', git.reset_hunk, { desc = 'reset git hunk' })
n('<leader>ghs', gitsigns.stage_hunk, { desc = 'git stage hunk' })
n('<leader>ghr', gitsigns.reset_hunk, { desc = 'git reset hunk' })
n('<leader>ghS', gitsigns.stage_buffer, { desc = 'git Stage buffer' })
n('<leader>ghu', gitsigns.undo_stage_hunk, { desc = 'undo stage hunk' })
n('<leader>ghR', gitsigns.reset_buffer, { desc = 'git Reset buffer' })
n('<leader>ghp', gitsigns.preview_hunk, { desc = 'preview git hunk' })
n('<leader>ghb', gitsigns.blame_line, { desc = 'git blame line' })
n('<leader>gtb', gitsigns.toggle_current_line_blame, { desc = 'toggle git blame line' })
n('<leader>gtd', gitsigns.toggle_deleted, { desc = 'toggle git show deleted' })

-- Search keymaps
label('<leader>s', '[S]earch')
n('<leader>sf', telescope_builtin.find_files, { desc = '[F]iles' })
n('<leader>s/', utils.fuzzy_search_current_buffer, { desc = '[/] Search in current buffer' })
n('<leader>ss', telescope_builtin.builtin, { desc = '[S]elect Telescope' })
n('<leader>sh', telescope_builtin.help_tags, { desc = '[H]elp' })
n('<leader>sw', telescope_builtin.grep_string, { desc = 'Current [W]ord' })
n('<leader>sg', telescope_builtin.live_grep, { desc = 'by [G]rep' })
n('<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'by [G]rep on Git Root' })
n('<leader>sd', telescope_builtin.diagnostics, { desc = '[D]iagnostics' })
n('<leader>sr', telescope_builtin.resume, { desc = '[R]esume' })
n('<leader>s?', telescope_builtin.oldfiles, { desc = '[?] Find [R]ecently opened files' })
n('<leader>s<space>', telescope_builtin.buffers, { desc = '[ ] Find open buffers' })

-- Formatting
n('<leader>f', utils.format_buffer, { desc = '[F]ormat current buffer' })

-- Workspace
label('<leader>w', '[W]orkspace')
n('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
n('<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
n('<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
n('<leader>wl', utils.workspace_list_folders, { desc = '[W]orkspace [L]ist folders' })

-- Tab management
if vim.g.tabs_enabled then
  label('t', '[T]abs')
  n('th', '<Cmd>BufferPrevious<CR>', { desc = 'Previous Tab' })
  n('tl', '<Cmd>BufferNext<CR>', { desc = 'Next Tab' })
  n('t<', '<Cmd>BufferMovePrevious<CR>', { desc = 'Move previous tab' })
  n('t>', '<Cmd>BufferMoveNext<CR>', { desc = 'Move next tab' })
  n('t1', '<Cmd>BufferGoto 1<CR>', { desc = 'Go to tab 1' })
  n('t2', '<Cmd>BufferGoto 2<CR>', { desc = 'Go to tab 2' })
  n('t3', '<Cmd>BufferGoto 3<CR>', { desc = 'Go to tab 3' })
  n('t4', '<Cmd>BufferGoto 4<CR>', { desc = 'Go to tab 4' })
  n('t5', '<Cmd>BufferGoto 5<CR>', { desc = 'Go to tab 5' })
  n('t6', '<Cmd>BufferGoto 6<CR>', { desc = 'Go to tab 6' })
  n('t7', '<Cmd>BufferGoto 7<CR>', { desc = 'Go to tab 7' })
  n('t8', '<Cmd>BufferGoto 8<CR>', { desc = 'Go to tab 8' })
  n('t9', '<Cmd>BufferGoto 9<CR>', { desc = 'Go to tab 9' })
  n('t0', '<Cmd>BufferLast<CR>', { desc = 'Go to last tab' })
  n('tp', '<Cmd>BufferPin<CR>', { desc = 'Pin tab' })
  n('tx', '<Cmd>BufferClose<CR>', { desc = 'Close tab' })
end

-- Yarn Package management
label('<leader>y', '[Y]arn')
n('<leader>ya', package_info.install, { desc = '[A]dd package' })
n('<leader>yv', package_info.change_version, { desc = 'Change package [V]ersion' })
