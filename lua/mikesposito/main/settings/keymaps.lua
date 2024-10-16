local dap = require 'dap'
local dapui = require 'dapui'
local telescope_builtin = require 'telescope.builtin'
local gitsigns = require 'gitsigns'
local package_info = require 'package-info'
local utils = require 'mikesposito.main.snippets.utils'
local git = require 'mikesposito.main.snippets.git'
local K = require 'custom.keymaps'
local P = require 'custom.preferences'

local v = utils.vmap
local n = utils.nmap
local label = utils.label

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
n(K.LEADER, '<Nop>', { silent = true })
v(K.LEADER, '<Nop>', { silent = true })
---- Remap for dealing with word wrap
n('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
n('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
---- Better pagination
n('<C-d>', '<C-d>zz', { noremap = true, silent = true })
n('<C-u>', '<C-u>zz', { noremap = true, silent = true })
---- Tmux panes navigation supports
n(K.JUMP_TO_LEFT_PANE, '<Cmd>NvimTmuxNavigateLeft<CR>', { desc = 'Jump to left pane' })
n(K.JUMP_TO_RIGHT_PANE, '<Cmd>NvimTmuxNavigateRight<CR>', { desc = 'Jump to right pane' })
n(K.JUMP_TO_BOTTOM_PANE, '<Cmd>NvimTmuxNavigateDown<CR>', { desc = 'Jump to down pane' })
n(K.JUMP_TO_TOP_PANE, '<Cmd>NvimTmuxNavigateUp<CR>', { desc = 'Jump to up pane' })

-- Code navigation
label(K.GOTO_, '[G]oto')
n(K.GOTO_DEFINITION, telescope_builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
n(K.GOTO_REFERENCES, telescope_builtin.lsp_references, { desc = '[G]oto [R]eferences' })
n(K.GOTO_IMPLEMENTATION, telescope_builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
n(K.GOTO_TYPE_DEFINITION, telescope_builtin.lsp_type_definitions, { desc = '[Goto Type [D]efinition' })

-- Documentation
label(K.DOCS_, '[D]ocumentation')
n(K.DOCS_SIGNATURE_HELP, vim.lsp.buf.signature_help, { desc = '[D]ocument [s]ignature' })
n(K.DOCS_SYMBOLS, telescope_builtin.lsp_document_symbols, { desc = '[D]ocument s[y]mbols' })
n(K.DOCS_HOVER, vim.lsp.buf.hover, { desc = '[D]ocumentation [h]over' })

-- Code Shortcuts
label(K.CODE_, '[C]ode')
n(K.CODE_ACTIONS, vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
n(K.CODE_RENAME, vim.lsp.buf.rename, { desc = '[R]ename' })
---- Code Swap handled by `nvim-treesitter`
label(K.CODE_SWAP, '[C]ode [S]wap')

-- Debug keymaps
label(K.DEBUG_, '[D]ebug')
n(K.DEBUG_TOGGLE_UI, dapui.toggle, { desc = '[D]ebug: [T]oggle UI' })
n(K.DEBUG_CONTINUE, dap.continue, { desc = '[D]ebug: Start/[C]ontinue' })
n(K.DEBUG_TOGGLE_BREAKPOINT, dap.toggle_breakpoint, { desc = '[D]ebug: Toggle [B]reakpoint' })
n(K.DEBUG_PREV_MESSAGE, vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
n(K.DEBUG_NEXT_MESSAGE, vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
n(K.DEBUG_OPEN_DIAGNOSTIC, vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
n(K.DEBUG_OPEN_DIAGNOSTIC_LIST, vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
label(K.DEBUG_STEP_, '[D]ebug [S]tep')
n(K.DEBUG_STEP_INTO, dap.step_into, { desc = 'Debug: Step Into' })
n(K.DEBUG_STEP_OVER, dap.step_over, { desc = 'Debug: Step Over' })
n(K.DEBUG_STEP_OUT, dap.step_out, { desc = 'Debug: Step Out' })

-- Troubles keymaps
n(K.TROUBLES, '<cmd>Trouble<cr>', { desc = 'Show [T]roubles' })

-- File tree keymaps
label(K.WINDOW_, '[W]indow')
n(K.WINDOW_TOGGLE_EXPLORER, '<Cmd>Neotree<CR>', { desc = 'Open file [E]xplorer' })
n(K.WINDOW_TOGGLE_SYMBOLS, '<cmd>AerialToggle<cr>', { desc = '[S]ymbols' })

-- Git Related keymaps
label(K.GIT_, '[G]it')
n(K.GIT_PULL, git.pull, { desc = '[p]ull' })
n(K.GIT_PUSH, git.push, { desc = '[P]ush' })
n(K.GIT_OPEN_LAZY_GIT, ':FloatermNew lazygit<cr>', { desc = 'Open lazygit' })
n(K.GIT_DIFF_INDEX, utils.diff_against_last_commit, { desc = '[D]iff against index' })
n(K.GIT_DIFF_LAST_COMMIT, gitsigns.diffthis, { desc = '[D]iff against last commit' })
label(K.GIT_HUNK_, '[H]unks')
v(K.GIT_HUNK_STAGE, git.stage_hunk, { desc = 'stage git hunk' })
v(K.GIT_HUNK_RESET, git.reset_hunk, { desc = 'reset git hunk' })
n(K.GIT_HUNK_STAGE, gitsigns.stage_hunk, { desc = 'git stage hunk' })
n(K.GIT_HUNK_RESET, gitsigns.reset_hunk, { desc = 'git reset hunk' })
n(K.GIT_BUFFER_STAGE, gitsigns.stage_buffer, { desc = 'git Stage buffer' })
n(K.GIT_STAGE_UNDO, gitsigns.undo_stage_hunk, { desc = 'undo stage hunk' })
n(K.GIT_BUFFER_RESET, gitsigns.reset_buffer, { desc = 'git Reset buffer' })
n(K.GIT_HUNK_PREVIEW, gitsigns.preview_hunk, { desc = 'preview git hunk' })
n(K.GIT_LINE_BLAME, gitsigns.blame_line, { desc = 'git blame line' })
n(K.GIT_TOGGLE_BLAME, gitsigns.toggle_current_line_blame, { desc = 'toggle git blame line' })
n(K.GIT_TOGGLE_SHOW_DELETED, gitsigns.toggle_deleted, { desc = 'toggle git show deleted' })
n(K.GIT_COPY_PERMALINK, function()
  git.copy_permalink 'n'
end, { desc = '[Y]ank permalink' })
v(K.GIT_COPY_PERMALINK, function()
  git.copy_permalink 'v'
end, { desc = '[Y]ank permalink' })

-- GitHub keymaps
label(K.GITHUB_, '[G]ithub')
label(K.GITHUB_PR_, '[P]ull requests')
n(K.GITHUB_PR_LIST, '<cmd>Octo pr list<cr>', { desc = '[L]ist' })
n(K.GITHUB_PR_SHOW, '<cmd>Octo pr show<cr>', { desc = '[S]how' })
n(K.GITHUB_PR_SHOW_CHANGES, '<cmd>Octo pr changes<cr>', { desc = '[C]hanges' })
label(K.GITHUB_ISSUE_, '[I]ssues')
n(K.GITHUB_ISSUE_LIST, '<cmd>Octo issue list<cr>', { desc = '[L]ist' })
label(K.GITHUB_REVIEW_, '[R]eview')
n(K.GITHUB_REVIEW_START, '<cmd>Octo review start<cr>', { desc = 'Start Review' })
n(K.GITHUB_REVIEW_RESUME, '<cmd>Octo review resume<cr>', { desc = 'Resume Review' })

-- Search keymaps
label(K.SEARCH_, '[S]earch')
n(K.SEARCH_FILES, telescope_builtin.find_files, { desc = '[F]iles' })
n(K.SEARCH_IN_CURRENT_BUFFER, utils.fuzzy_search_current_buffer, { desc = '[/] Search in current buffer' })
n(K.SEARCH_IN_EDITOR_SETTINGS, telescope_builtin.builtin, { desc = '[S]elect Telescope' })
n(K.SEARCH_HELP, telescope_builtin.help_tags, { desc = '[H]elp' })
n(K.SEARCH_CURRENT_WORD, telescope_builtin.grep_string, { desc = 'Current [W]ord' })
n(K.SEARCH_GREP, telescope_builtin.live_grep, { desc = 'by [G]rep' })
n(K.SEARCH_GREP_GIT_ROOT, ':LiveGrepGitRoot<cr>', { desc = 'by [G]rep on Git Root' })
n(K.SEARCH_DIAGNOSTICS, telescope_builtin.diagnostics, { desc = '[D]iagnostics' })
n(K.SEARCH_RESUME, telescope_builtin.resume, { desc = '[R]esume' })
n(K.SEARCH_RECENT_FILES, telescope_builtin.oldfiles, { desc = '[?] Find [R]ecently opened files' })
n(K.SEARCH_OPEN_BUFFERS, telescope_builtin.buffers, { desc = '[ ] Find open buffers' })

-- Formatting
n(K.FORMAT_CURRENT_BUFFER, utils.format_buffer, { desc = '[F]ormat current buffer' })

-- Tab management
if P.WINDOW_TABS_ENABLED then
  label(K.TABS_, '[T]abs')
  n(K.TABS_GOTO_PREVIOUS, '<Cmd>BufferPrevious<CR>', { desc = 'Previous Tab' })
  n(K.TABS_GOTO_NEXT, '<Cmd>BufferNext<CR>', { desc = 'Next Tab' })
  n(K.TABS_MOVE_LEFT, '<Cmd>BufferMovePrevious<CR>', { desc = 'Move previous tab' })
  n(K.TABS_MOVE_RIGHT, '<Cmd>BufferMoveNext<CR>', { desc = 'Move next tab' })
  n(K.TABS_GOTO_1, '<Cmd>BufferGoto 1<CR>', { desc = 'Go to tab 1' })
  n(K.TABS_GOTO_2, '<Cmd>BufferGoto 2<CR>', { desc = 'Go to tab 2' })
  n(K.TABS_GOTO_3, '<Cmd>BufferGoto 3<CR>', { desc = 'Go to tab 3' })
  n(K.TABS_GOTO_4, '<Cmd>BufferGoto 4<CR>', { desc = 'Go to tab 4' })
  n(K.TABS_GOTO_5, '<Cmd>BufferGoto 5<CR>', { desc = 'Go to tab 5' })
  n(K.TABS_GOTO_6, '<Cmd>BufferGoto 6<CR>', { desc = 'Go to tab 6' })
  n(K.TABS_GOTO_7, '<Cmd>BufferGoto 7<CR>', { desc = 'Go to tab 7' })
  n(K.TABS_GOTO_8, '<Cmd>BufferGoto 8<CR>', { desc = 'Go to tab 8' })
  n(K.TABS_GOTO_9, '<Cmd>BufferGoto 9<CR>', { desc = 'Go to tab 9' })
  n(K.TABS_GOTO_LAST, '<Cmd>BufferLast<CR>', { desc = 'Go to last tab' })
  n(K.TABS_PIN, '<Cmd>BufferPin<CR>', { desc = 'Pin tab' })
  n(K.TABS_CLOSE_CURRENT, '<Cmd>BufferClose<CR>', { desc = 'Close tab' })
end

-- Yarn Package management
label(K.YARN_, '[Y]arn')
n(K.YARN_ADD, package_info.install, { desc = '[A]dd package' })
n(K.YARN_CHANGE_VERSION, package_info.change_version, { desc = 'Change package [V]ersion' })
