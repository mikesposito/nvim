local nmap = function(key, cmd, opts)
  vim.keymap.set('n', key, cmd, opts)
  require('which-key').register {
    [key] = { name = opts.desc or cmd, _ = 'which_key_ignore' },
  }
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

-- LazyGit on Floating terminal
nmap('<leader>gg', ':FloatermNew lazygit<cr>', { desc = 'Open lazygit' })

-- Telescope keymaps
nmap('<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nmap('<leader>s/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })
nmap('<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
nmap('<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
nmap('<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
nmap('<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
nmap('<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
nmap('<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
nmap('<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
nmap('<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
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

-- Tab management
---- Move to previous/next
nmap('<C-h>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous Tab' })
nmap('<C-l>', '<Cmd>BufferNext<CR>', { desc = 'Next Tab' })
---- Re-order to previous/next
nmap('<C-<>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Move previous tab' })
nmap('<C->>', '<Cmd>BufferMoveNext<CR>', { desc = 'Move next tab' })
---- Goto buffer in position...
nmap('<C-1>', '<Cmd>BufferGoto 1<CR>', { desc = 'Go to tab 1' })
nmap('<C-2>', '<Cmd>BufferGoto 2<CR>', { desc = 'Go to tab 2' })
nmap('<C-3>', '<Cmd>BufferGoto 3<CR>', { desc = 'Go to tab 3' })
nmap('<C-4>', '<Cmd>BufferGoto 4<CR>', { desc = 'Go to tab 4' })
nmap('<C-5>', '<Cmd>BufferGoto 5<CR>', { desc = 'Go to tab 5' })
nmap('<C-6>', '<Cmd>BufferGoto 6<CR>', { desc = 'Go to tab 6' })
nmap('<C-7>', '<Cmd>BufferGoto 7<CR>', { desc = 'Go to tab 7' })
nmap('<C-8>', '<Cmd>BufferGoto 8<CR>', { desc = 'Go to tab 8' })
nmap('<C-9>', '<Cmd>BufferGoto 9<CR>', { desc = 'Go to tab 9' })
nmap('<C-0>', '<Cmd>BufferLast<CR>', { desc = 'Go to last tab' })
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
