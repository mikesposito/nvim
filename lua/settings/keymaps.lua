--- Add a label to document the keymap
--- @param key string
--- @param desc string
local label = function(key, desc)
  require('which-key').register {
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
  label(key, opts.desc or cmd)
end

-- Map a key in visual mode
local vmap = function(key, cmd, opts)
  vim.keymap.set('v', key, cmd, opts)
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
nmap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
nmap(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
nmap('<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
nmap('<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Better pagination
nmap('<C-d>', '<C-d>zz', { noremap = true, silent = true })
nmap('<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Tmux panes navigation supports
nmap('<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { desc = 'Jump to left pane' })
nmap('<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { desc = 'Jump to right pane' })
nmap('<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { desc = 'Jump to down pane' })
nmap('<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { desc = 'Jump to up pane' })

-- Git Related keymaps
label('<leader>g', '[G]it')
label('<leader>gh', '[H]unks')
nmap('<leader>gg', ':FloatermNew lazygit<cr>', { desc = 'Open lazygit' })
-- -- Git actions in visual mode
local gs = require 'gitsigns'
vmap('<leader>ghs', function()
  gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'stage git hunk' })
vmap('<leader>ghr', function()
  gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'reset git hunk' })
-- -- Git actions in normal mode
nmap('<leader>ghs', gs.stage_hunk, { desc = 'git stage hunk' })
nmap('<leader>ghr', gs.reset_hunk, { desc = 'git reset hunk' })
nmap('<leader>ghS', gs.stage_buffer, { desc = 'git Stage buffer' })
nmap('<leader>ghu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
nmap('<leader>ghR', gs.reset_buffer, { desc = 'git Reset buffer' })
nmap('<leader>ghp', gs.preview_hunk, { desc = 'preview git hunk' })
nmap('<leader>ghb', function()
  gs.blame_line { full = false }
end, { desc = 'git blame line' })
nmap('<leader>ghd', gs.diffthis, { desc = 'git diff against index' })
nmap('<leader>ghD', function()
  gs.diffthis '~'
end, { desc = 'git diff against last commit' })
-- -- Git toggles in normal mode
nmap('<leader>gtb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
nmap('<leader>gtd', gs.toggle_deleted, { desc = 'toggle git show deleted' })

-- Search keymaps
label('<leader>s', '[S]earch')
nmap('<leader>sf', require('telescope.builtin').find_files, { desc = '[F]iles' })
nmap('<leader>s/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[/] in Open Files' })
nmap('<leader>ss', require('telescope.builtin').builtin, { desc = '[S]elect Telescope' })
nmap('<leader>sh', require('telescope.builtin').help_tags, { desc = '[H]elp' })
nmap('<leader>sw', require('telescope.builtin').grep_string, { desc = 'Current [W]ord' })
nmap('<leader>sg', require('telescope.builtin').live_grep, { desc = 'by [G]rep' })
nmap('<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'by [G]rep on Git Root' })
nmap('<leader>sd', require('telescope.builtin').diagnostics, { desc = '[D]iagnostics' })
nmap('<leader>sr', require('telescope.builtin').resume, { desc = '[R]esume' })
nmap('<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
nmap('<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
nmap('<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Formatting
nmap('<leader>f', function()
  require('conform').format {
    lsp_fallback = false,
    async = false,
    timeout_ms = 5000,
  }
end, { desc = 'Format current buffer' })

-- Language Servers
nmap('<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
nmap('<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
nmap('gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition' })
nmap('gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
nmap('gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'Type [D]efinition' })
nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
nmap('K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
nmap('<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })
nmap('gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
nmap('<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist Folde rs' })
nmap('<C-k>', require('lsp_signature').toggle_float_win, { desc = 'Toggle signature help' })
nmap('<Leader>k', vim.lsp.buf.signature_help, { desc = 'toggle signature' })

-- Split windows navigation
-- nmap('<C-k>', ':wincmd k<CR>', { desc = 'Move to bottom window split', silent = true })
-- nmap('<C-j>', ':wincmd j<CR>', { desc = 'Move to top window split', silent = true })

-- Tab management
if vim.g.tabs_enabled then
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
  nmap('<A-p>', '<Cmd>BufferPin<CR>', { desc = 'Pin tab' })
  ---- Close buffer
  nmap('<C-x>', '<Cmd>BufferClose<CR>', {})
  -- Close commands
  --                 :BufferCloseAllButCurrent
  --                 :BufferCloseAllButPinned
  --                 :BufferCloseAllButCurrentOrPinned
  --                 :BufferCloseBuffersLeft
  --                 :BufferCloseBuffersRight
  -- Magic buffer-picking mode
  nmap('<C-p>', '<Cmd>BufferPick<CR>', {})
  -- Sort automatically by...
  nmap('<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', {})
  nmap('<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', {})
  nmap('<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', {})
  nmap('<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', {})
end

-- Yarn Package management
label('<leader>y', 'Yarn')
nmap('<leader>ya', require('package-info').install, { desc = '[A]dd package' })
nmap('<leader>yv', require('package-info').change_version, { desc = 'Change package [V]ersion' })
